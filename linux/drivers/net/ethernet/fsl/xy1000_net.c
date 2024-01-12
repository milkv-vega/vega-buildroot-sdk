/************************************************************
  Copyright (C), 2010-2011, FiberHome.
  FileName: 		xy1000_net.c
  Author:		zhenxin.xie    
  Version : 		1.0.0		 
  Date: 			2011-01-13
  Description:	   
				EPON OLT FPAG Project: driver codes for MAC module.
				This is base on the new DMA driver.
				
				This file implements the two parts functions
				1. provides standard open/read/write/ioctl.. files operation interface for application to call
				2. provides virtual mac driver and process Skb packets, upper will see it as a virtual network adapter.
				
  History:
	<author>	<time>		<version >		<desc>
      zhenxin.xie  2011-01-13	  1.0.0 			codes before sumbit to SVN for the ending of OLT FPGA Project
	  
***********************************************************/ 
#include <linux/device.h>
#include <linux/module.h>
#include <linux/mm.h> // for mmap() 
#include <linux/errno.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/miscdevice.h>
#include <linux/string.h>
#include <linux/sched.h>
#include <linux/interrupt.h> // must included this header file for tasklet and irq
#include <linux/timer.h>

#include <linux/netdevice.h>
#include <linux/etherdevice.h>


#include <asm/io.h>
#include <asm/irq.h>

#include <linux/of.h>
#include <linux/of_net.h>
#include <linux/of_irq.h>
#include <linux/of_device.h>
#include <linux/of_address.h>

#include <linux/ethtool.h>
#include <linux/delay.h>
#include <linux/platform_device.h>
#include <linux/irq.h>
#include <linux/slab.h>
#include <linux/regulator/consumer.h>
#include <linux/gpio.h>
#include <linux/of_gpio.h>
#include <linux/netlink.h>
#include <net/sock.h>

#include <asm/delay.h>
#include <linux/mutex.h>

#include "xy1000_net.h"

#define debug_level 0

//#define SYSCTRL_BASE          0xE084a000
#define SYSCLK_CTRL           0xE084C000
#define SYSRST_CTRL           0xE084E000
#define BLK_SFT_RST_CSR       (0X00L)
#define CLK_GEN_CSR           (0X24)
#define AXI_EMAC_CLK_EN              (18L )
#define SFT_RSTN_AXI_EMAC                (18L )
#define SFT_RSTN_DMA       (19L)

enum {IP_RESET = 0, IP_RELEASE = 1};
enum {IPCLK_DIS = 0,  IPCLK_EN = 1};

#if (debug_level == 0)
#define eolt_error		printk
#define eolt_debug
#define eolt_info
#endif

#if(debug_level == 1)
#define eolt_error 	printk
#define eolt_debug	printk
#define eolt_info
#endif

#if(debug_level == 2)
#define eolt_error		printk
#define eolt_debug	printk	 // to show the value of para
#define eolt_info		printk	// to trace program workflow
#endif

static int device_is_present = 0;
static unsigned int irq_dma_mask = 0;
static unsigned int tx_stat=0;
spinlock_t tx_lock,filter_lock;

struct sock *nlsk = NULL;
extern struct net init_net;

/* Packet filters */
LIST_HEAD(_filter_list);

extern void dma_tx_start( struct net_device *dev ,int ip_summed,unsigned short pkt_len, unsigned char *data);
extern void dma_rx_start( struct net_device *dev );
extern void mac_eth_init( struct net_device *dev);


#define dma_reg_read(addr) \
		(*(volatile unsigned int *)(addr))
		
#define dma_reg_write(addr, value) \
		(*(unsigned int *)(addr) = (value))

#define SET_ATTRIBUTE(raw_val,attr_offset,attr_length,atrr_val) \
		(((u32)raw_val&(~((((u32)1L<<(u32)attr_length)-(u32)1L)<<(u32)attr_offset)))|((u32)atrr_val<<(u32)attr_offset))

#define GET_ATTRIBUTE(raw_val,attr_offset,attr_length) \
		(((u32)raw_val&(((((u32)1L<<(u32)attr_length)-(u32)1L)<<(u32)attr_offset)))>>(u32)attr_offset)

//dma_port=0,1  0:PTP,1:OAM
static uint dma_port=1;
module_param(dma_port,uint,0664);

//设置带外端口
static uint net_port=0;
module_param(net_port,uint,0664);

#define NETLINK_DMA      30
#define USER_PORT        1234321

static struct net_device *eth_ndev,*vir_ndev;

static int send_usrmsg(unsigned char *pbuf, uint16_t len)
{
    struct sk_buff *nl_skb;
    struct nlmsghdr *nlh;

    int ret;

    /*创建sk_buff 空间*/
    nl_skb = nlmsg_new(len, GFP_ATOMIC);
    if(!nl_skb)
    {
        printk("netlink alloc failure\n");
        return -1;
    }
    /*设置netlink消息头部*/
    nlh = nlmsg_put(nl_skb, 0, 0, NETLINK_DMA, len, 0);
    if(nlh == NULL)
    {
        printk("nlmsg_put failaure \n");
        nlmsg_free(nl_skb);
        return -1;
    }
    /*拷贝数据发送*/
    memcpy(nlmsg_data(nlh), pbuf, len);
    ret = netlink_unicast(nlsk, nl_skb, USER_PORT, MSG_DONTWAIT);
    return ret;
}

static void netlink_rcv_msg(struct sk_buff *skb)
{
    struct nlmsghdr *nlh = NULL;
    unsigned char *umsg = NULL;
	unsigned long flags;
	struct mac_eth_priv *priv = netdev_priv(eth_ndev);
	uint32_t dmaport=1;
	uint16_t pkt_align_len;
	int32_t pkt_len;

	//pkt_len = skb->len - nlmsg_total_size(8);// lenth of data without private pkt head
	nlh = nlmsg_hdr(skb);
	umsg = NLMSG_DATA(nlh);//begin with private pkt head
	pkt_len = ((int)(*(umsg+6) & 0x3F)<<8)+ *(umsg+7);

    if((pkt_len <= 0) || (pkt_len>16375) || (umsg[0]!=0xc7))
    {
    	printk("pkt format wrong\n");
    	return;
    }
	else
    {

        if(umsg)
        {
			spin_lock_irqsave(&tx_lock, flags);
			if (1 == tx_stat){
				printk("send pkt busy\n");	
				spin_unlock_irqrestore(&tx_lock, flags);
				return;
			}
			else{
				tx_stat=1;	//设置tx状态为忙
				spin_unlock_irqrestore(&tx_lock, flags);

				//pkt_len += 4; //skb has no crc, so add 4 bytes crc, filled with zero.

				memset(mac_tx_buf,0,pkt_len+ 16);
				memcpy(mac_tx_buf, umsg, pkt_len + 4);//put data into tx buffer, include SOP
				if(pkt_len>0x40){
					mac_tx_buf[7]= (pkt_len) & 0xff;
					mac_tx_buf[6]= (((pkt_len >>8) & 0x3f) | (mac_tx_buf[6] & 0xc0));
					pkt_align_len= ((pkt_len+7)/8)*8;
				}else{
					pkt_align_len= 64;
					mac_tx_buf[7]= 0x40;
					mac_tx_buf[6]= (mac_tx_buf[6] & 0xc0);
				}
				/*
				if(dmaport==0)   //if dmaport=ptp(0), then ppbypass must be 1
				{
					mac_tx_buf[5]= (mac_tx_buf[5] | 0x10);
				}
				*/
/*				for(i=0;i<pkt_len;i++)
				{
					printk("0x%02x ",mac_tx_buf[i+8]);
					if(i%8 == 0)
						printk("\n");
				}
*/				
				spin_lock_irqsave(&priv->lock, flags);
			    dma_reg_write(priv->io_addr + DMA_TX_ADDR, (unsigned int)dma_tx_handler); //set phy addr
				dma_reg_write(priv->io_addr + DMA_TX_CFG, ((dmaport << 12)+(pkt_align_len+8)/8));   //set lenth and port
			    dma_reg_write(priv->io_addr + DMA_TX_START, 1);                           //start tx
			    spin_unlock_irqrestore(&priv->lock, flags);
			}
        }
    }
}

struct netlink_kernel_cfg nl_cfg = {
        .input  = netlink_rcv_msg, /* set recv callback */
};



void mac_phy_write(struct net_device *dev,unsigned int phy_addr, unsigned int reg_addr,unsigned int data)
{
	struct mac_eth_priv *priv = netdev_priv(dev);


	dma_reg_write(priv->io_addr + 0x420, (phy_addr<<7) + (reg_addr<<2) + (1<<1));
	mdelay(1);
	dma_reg_write(priv->io_addr + 0x424, data);

}

void mac_phy_read(struct net_device *dev,unsigned int phy_addr, unsigned int reg_addr,unsigned int *data)
{
	struct mac_eth_priv *priv = netdev_priv(dev);

	unsigned int tmp;


	dma_reg_write(priv->io_addr + 0x420, (phy_addr<<7) + (reg_addr<<2) + (0<<1));
	
	do
	{
		tmp = dma_reg_read(priv->io_addr + 0x420);
		mdelay(1);
	}while(0 == ((tmp >> 12) & 0x1));

	*data = dma_reg_read(priv->io_addr + 0x424);

}

void sys_ctrl_reset(struct mac_eth_priv *fiber_priv, u32 rst_num, u32 rst_attri)
{
    u32 val32 = dma_reg_read(fiber_priv->sysrst_regs+BLK_SFT_RST_CSR);
    val32 = SET_ATTRIBUTE(val32,rst_num,1,rst_attri);
    dma_reg_write(fiber_priv->sysrst_regs+BLK_SFT_RST_CSR,val32);
}

void sys_ctrl_clk(struct mac_eth_priv *fiber_priv, u32 clk_num, u32 clk_attri)
{
    u32 val32 = dma_reg_read(fiber_priv->sysclk_regs+CLK_GEN_CSR);
    val32 = SET_ATTRIBUTE(val32,clk_num,1,clk_attri);
    dma_reg_write(fiber_priv->sysclk_regs+CLK_GEN_CSR,val32);
}



/* Our watchdog timed out. Called by the networking layer */
static void fbhm_timeout(struct net_device *dev, u32 timecount)
{
	struct mac_eth_priv *priv = netdev_priv(dev);
//	unsigned long flags;
	printk("#####enter %s######\n",__FUNCTION__);
	
	/* Save previous register address */
//	spin_lock_irqsave(&priv->lock, flags);
//	db->in_timeout = 1;
//	reg_save = readb(db->io_addr);

	netif_stop_queue(dev);


//	sys_ctrl_clk(priv,SFT_RSTN_DMA, IPCLK_DIS);
	sys_ctrl_clk(priv,AXI_EMAC_CLK_EN, IPCLK_DIS);
	sys_ctrl_reset(priv,SFT_RSTN_AXI_EMAC, IP_RESET);
//	sys_ctrl_reset(priv,SFT_RSTN_DMA, IP_RESET);
	mdelay(1);

//	sys_ctrl_clk(priv,SFT_RSTN_DMA, IPCLK_EN);
	sys_ctrl_clk(priv,AXI_EMAC_CLK_EN, IPCLK_EN);
	sys_ctrl_reset(priv,SFT_RSTN_AXI_EMAC, IP_RELEASE);//release, block is not soft reset^M
//	sys_ctrl_reset(priv,SFT_RSTN_DMA, IP_RELEASE);


	netif_start_queue(dev);	
	mac_eth_init(dev);


	/* We can accept TX packets again */
//	dev->trans_start = jiffies; /* prevent tx timeout */
	netif_wake_queue(dev);

	/* Restore previous register address */
//	writeb(reg_save, db->io_addr);
//	db->in_timeout = 0;
//	spin_unlock_irqrestore(&priv->lock, flags);

}


/**
 * fbhm_eth_mac_addr - set new Ethernet hardware address
 * @dev: network device
 * @p: socket address
 *
 * Change hardware address of device.
 *
 * This doesn't change hardware matching, so needs to be overridden
 * for most real devices.
 */
int fbhm_eth_mac_addr(struct net_device *dev, void *p)
{
	int ret;
	
	/*added by Pengfei*/
#if 1
	ret = eth_prepare_mac_addr_change(dev, p);
	if (ret < 0)
		return ret;
	eth_commit_mac_addr_change(dev, p);
#endif
	return 0;
}


static void fbhm_reset( struct net_device *dev )
{
//	struct mac_eth_priv *priv = netdev_priv(dev);

/*added by Pengfei*/	

//	sys_ctrl_reset(SFT_RSTN_MAC, 0);
//	sys_ctrl_reset(SFT_RSTN_MAC, 1);
	
}

static irqreturn_t fbhm_interrupt_tx_end(int irq, void *dev_id)
{
	unsigned long flags;
	//struct net_device *dev = dev_id;
	//struct mac_eth_priv *priv = netdev_priv(dev);
	spin_lock_irqsave(&tx_lock, flags);
	tx_stat=0;//tx状态为空闲
	spin_unlock_irqrestore(&tx_lock, flags);
	return IRQ_HANDLED;
}
static irqreturn_t fbhm_interrupt_rx_req(int irq, void *dev_id)
{
	struct net_device *dev = dev_id;
	struct mac_eth_priv *priv = netdev_priv(dev);
/*	unsigned long flags;
	printk("#enter %s\n",__FUNCTION__);
	spin_lock_irqsave(&priv->lock, flags);
	irq_dma_mask |= IRQ_DMA_RX_REQ_MASK;
	dma_reg_write(priv->io_addr + DMA_INT_MASK, irq_dma_mask);  //关rx_req中断
	spin_unlock_irqrestore(&priv->lock, flags);
*/
	dma_reg_write(priv->io_addr + DMA_INT_MASK, ((~IRQ_DMA_TX_END_MASK) & (IRQ_DMA_RX_REQ_MASK | IRQ_DMA_RX_END_MASK))); //关rx_req中断

	dma_rx_start(dev);
	return IRQ_HANDLED;
}
static irqreturn_t fbhm_interrupt_rx_end(int irq, void *dev_id)
{
	struct net_device *dev = dev_id;
	struct mac_eth_priv *priv = netdev_priv(dev);
/*	unsigned long flags;
	printk("#enter %s\n",__FUNCTION__);
	spin_lock_irqsave(&priv->lock, flags);
	irq_dma_mask |= IRQ_DMA_RX_END_MASK;
	dma_reg_write(priv->io_addr + DMA_INT_MASK, irq_dma_mask);  //关rx_end中断
	spin_unlock_irqrestore(&priv->lock, flags);
*/
	dma_reg_write(priv->io_addr + DMA_INT_MASK, ((~IRQ_DMA_TX_END_MASK) & (IRQ_DMA_RX_REQ_MASK | IRQ_DMA_RX_END_MASK))); //关rx_end中断
	//printk("2\n");

	tasklet_schedule(&priv->fbhm_irq_task);
	return IRQ_HANDLED;
}


/*
	user in shell input: ifconfig eolt_eth0 up
	will call this function
*/
int fbhm_mac_eth_open(struct net_device *dev)
{	
	struct mac_eth_priv *priv = NULL;
//	int ret = 0;
	//eolt_error("Enter fbhm_mac_eth_open..\n");
	//printk("#enter %s\n",__FUNCTION__);
	
	priv = netdev_priv(dev);
	if(!priv) 
	{
		eolt_error("fbhm_mac_eth_open: get netdev_priv struct failed\n");
		return -1;
	}

	// init hw resource, such as irq, mem region and so on..
	// we don't need hw resouce here.
	// get HW eth addr 
	// TODO: how can we get hw addr from mac module?
	
	netif_start_queue(dev);
	priv->mac_eth_open = 1;

	/*added by zjy*/
	irq_dma_mask = 0;
	dma_reg_write(priv->io_addr + DMA_INT_MASK, irq_dma_mask); //start rx_req,rx_end,tx_end
	//mac_eth_init(dev);
	return 0; // open success
}

/*
	This function will be called by shell "rmmod xy1000_net"
*/
int xy1000_net_eth_release(struct net_device *dev)
{			
	struct mac_eth_priv *priv = NULL;
	//eolt_error("Enter xy1000_net_eth_release..\n");
	
	priv = netdev_priv(dev);

	tasklet_kill(&priv->fbhm_irq_task);
	// release ports, irq and such -- like fops->close
	netif_stop_queue(dev);
	priv->mac_eth_open = 0;
	device_is_present = 0;
	irq_dma_mask = 0;
	tx_stat=0;
    //dma_free_coherent(priv->dev, DMA_PKT_MAX_SIZE*2, dma_addr, dma_handler);
	iounmap(dma_addr); 

#if 1
	/* unmap our resources */
	iounmap(priv->io_addr); 
	/* release the resources */
	if (priv->addr_req)
		release_resource(priv->addr_req);
	kfree(priv->addr_req);
#endif

	/* free interrupt */
	free_irq(priv->tx_end_irq, dev);
	free_irq(priv->rx_end_irq, dev);
	free_irq(priv->rx_req_irq, dev);
	return 0; // release success
}


/*
 * Stop the interface.
 * The interface is stopped when it is brought.
 */
static int
fbhm_stop(struct net_device *ndev)
{
	struct mac_eth_priv *priv = NULL;
//	eolt_error("Enter fbhm_stop..\n");

	priv = netdev_priv(ndev);

	netif_stop_queue(ndev);

	/* free interrupt */
//	free_irq(priv->irq, ndev);

	/* RESET device */
	fbhm_reset(ndev);	/* PHY RESET */

	//dma_reg_write(priv->io_addr+FBHM_MAC_CNTL, 0x016);	/* Disable RX */

	return 0;
}


/*
	Notice: MAC module is not a real network adapter, it will not automatic add 4bytes crc, need software does it.
*/
int fbhm_mac_eth_tx(struct sk_buff *skb, struct net_device *dev)
{	
	unsigned long len;
	unsigned char *data;
	unsigned long flags;

	struct mac_eth_priv *priv = netdev_priv(dev);
	
//	eolt_error("Enter tx..\n");
	data = skb->data;
	len = skb->len;

#if 1
	spin_lock_irqsave(&tx_lock, flags);
	if (1 == tx_stat){
		spin_unlock_irqrestore(&tx_lock, flags);
		priv->stats.tx_dropped++;
		return NETDEV_TX_BUSY;
	}
    else{
    	tx_stat=1;	//设置tx状态为忙
    	spin_unlock_irqrestore(&tx_lock, flags);
		dma_tx_start( dev, skb->ip_summed, skb->len, data);
    }
	/* free this SKB */
	dev_consume_skb_any(skb);
	return NETDEV_TX_OK;
#endif
}

void dma_rx_start( struct net_device *dev )
{
	struct mac_eth_priv *priv = netdev_priv(dev);
/*	unsigned long flags;
	printk("#enter %s\n",__FUNCTION__);
	spin_lock_irqsave(&priv->lock, flags);
	irq_dma_mask &= ~IRQ_DMA_RX_END_MASK;
	dma_reg_write(priv->io_addr + DMA_INT_MASK, irq_dma_mask); //start rx_end
	spin_unlock_irqrestore(&priv->lock, flags);
*/
	dma_reg_write(priv->io_addr + DMA_INT_MASK, (~(IRQ_DMA_RX_END_MASK | IRQ_DMA_TX_END_MASK) & IRQ_DMA_RX_REQ_MASK)); //start rx_req
	dma_reg_write(priv->io_addr + DMA_RX_ADDR, (unsigned int)dma_rx_handler); //set phy addr
	dma_reg_write(priv->io_addr + DMA_RX_START, 1); 						  //start rx
	//printk("1\n");
}

void dma_tx_start( struct net_device *dev ,int ip_summed,unsigned short pkt_len, unsigned char *data)
{
	unsigned long flags;
	uint16_t pkt_align_len;
	uint8_t pkt_head[8]={0xc7,0x04,0xdd,0x7b,0x00,0x20,0x00,0x40};
	struct mac_eth_priv *priv=netdev_priv(dev);
	//printk("Enter dma_tx_start..\n");
	pkt_len+=4; //skb has no crc, so add 4 bytes crc, filled with zero.
	if(pkt_len>16375 || pkt_len<=0)
	{
		//printk("#pkt size err %s\n",__FUNCTION__);
		spin_lock_irqsave(&tx_lock, flags);
		tx_stat=0;
		spin_unlock_irqrestore(&tx_lock, flags);
		priv->stats.tx_errors++;
		return;
	}
	if(pkt_len>0x40){
		pkt_head[7]= (pkt_len) & 0xff;
		pkt_head[6]= ((pkt_len) >>8) & 0x3f;
		pkt_align_len=((pkt_len+7)/8)*8;
	}else{
		pkt_align_len=64;
		pkt_head[7]=0x40;
		pkt_head[6]=0;
	}
	
	if(memcmp(dev->name,"vir0",sizeof("vir0"))==0)   //经过pp,0x20
	{
		//printk("net->name:%s\n",dev->name);
		//pkt_head[5] = pkt_head[5] & 0xef;
		pkt_head[5] = (pkt_head[5] & 0xe0);
		pkt_head[6] = (pkt_head[6] & 0x3f) | ((net_port & 0x03)<<6);
	}
	else                              //不经过pp,0x30
	{
		pkt_head[5] = (pkt_head[5] & 0xf0) | ((net_port & 0x3c)>>2) | 0x10;
		pkt_head[6] = (pkt_head[6] & 0x3f) | ((net_port & 0x03)<<6);
	}
	
	memset(mac_tx_buf,0,pkt_align_len+8);
	memcpy(mac_tx_buf, pkt_head, 8);
	memcpy(mac_tx_buf+8, data, pkt_len);//put data into tx buffer

	//udelay(1);

	spin_lock_irqsave(&priv->lock, flags);
    dma_reg_write(priv->io_addr + DMA_TX_ADDR, (unsigned int)dma_tx_handler); //set phy addr
	dma_reg_write(priv->io_addr + DMA_TX_CFG, ((dma_port << 12)+(pkt_align_len+8)/8));   //set lenth and port
    dma_reg_write(priv->io_addr + DMA_TX_START, 1); //start tx
	priv->stats.tx_packets++;
	priv->stats.tx_bytes +=pkt_len;
    spin_unlock_irqrestore(&priv->lock, flags);
}


void mac_eth_init(struct net_device *dev)
{		
	//printk("#enter %s\n",__FUNCTION__);
}

static uint16_t filter_match_rx_pkt(uint8_t *pkt,uint32_t pkt_len)
{
    struct list_head *list;
    pkt_filter_t *filter;
    kcom_filter_t *kf;
    int wsize;
    int idx, match;
	unsigned long flags;
	uint32_t *data;
	uint16_t dest_type;
	spin_lock_irqsave(&filter_lock, flags);
    list_for_each(list, &_filter_list) 
	{
        filter = (pkt_filter_t *)list;
        kf = &filter->kf;
		data = (uint32_t *)(pkt+ kf->pkt_data_offset);
		wsize = BYTES2WORDS(kf->pkt_data_size);

		if(kf->type != KCOM_FILTER_T_RX_PKT)
		{
			continue;
		}
        match = 1;
        for (idx = 0; idx < wsize; idx++) 
		{
            if ((data[idx]       & kf->mask.w[idx]) != 
				(kf->data.w[idx] & kf->mask.w[idx])  ) 
			{
                match = 0;
                break;
            }
        }
        if (match) {
			dest_type = filter->kf.dest_type;
			spin_unlock_irqrestore(&filter_lock, flags);
            return dest_type;
        }
    }
	spin_unlock_irqrestore(&filter_lock, flags);
    return KCOM_DEST_T_NULL;
}


/*
 * SOC Interrupt Table
 *
 * The table is stored in priority order:  Interrupts that are listed
 * first have their handlers called first.
 *
 * A handler can clear more than one interrupt bit to prevent a
 * subsequent handler from being called.  E.g., if the DMA CHAIN_DONE
 * handler clears both CHAIN_DONE and DESC_DONE, the DESC_DONE handler
 * will not be called.
 */
#define COUNTOF(ary)		((int) (sizeof (ary) / sizeof ((ary)[0])))

typedef void (*ifn_t)(struct net_device *dev, unsigned int data);

/*byte swap 32bits data*/
#define	SWAP_INT(value)		( (value&0xff000000)>>24 )|( (value&0xff)<<24 )|( (value&0xff00)<<8 ) |( (value&0xff0000)>>8 ) 

static void drop_vlantag(unsigned char *data,int *ip_len)
{
	int len,i;
	if(data==NULL || ip_len==NULL || (*ip_len) < 14)
	{
		return;
	}
	for(i=0;i<2;i++)
	{
		len = *ip_len;
		if(   ((data[12]==0x81) && (data[13]==0x00))
			||((data[12]==0x91) && (data[13]==0x00))
			||((data[12]==0x88) && (data[13]==0xa8)))
		{
			memcpy(data+12,data+14,len-14);
			*ip_len -= 2;
		}else
		{
			break;
		}
	}
}
static void pkt_netif_rx(struct net_device *dev,unsigned char *data,int ip_len,uint8_t is_drop_vlantag)
{
    unsigned char *ptr;
	int res;
	struct mac_eth_priv *priv = netdev_priv(dev);

	if(is_drop_vlantag == 1)
	{
		drop_vlantag(data,&ip_len);
	}

	// 1. alloc skb
	if(priv->rx_skb == NULL) 
	{
		priv->rx_skb = dev_alloc_skb(ip_len+2); // allocate_skb will atuomaticly alloc IP_PACKET_SIZE+ETHER_HEADER_SIZE
		if(priv->rx_skb == NULL) 
		{			
			eolt_error("soc_dma_process_done_pkt: allocate skb failed\n");
			return;
		}	
	}		
	// 2. copy frame data to skb
	skb_reserve (priv->rx_skb, 2); // 16bytes align, because EHTER_HEADER is 14bytes
	ptr = skb_put(priv->rx_skb, ip_len);
	memcpy(ptr, data, ip_len); // don't need the last crc bytes
	
	priv->rx_skb->dev = (struct net_device *)dev;
	priv->rx_skb->protocol = eth_type_trans(priv->rx_skb, dev);
	res = netif_rx(priv->rx_skb);
	if(res == 0)
	{
		priv->stats.rx_packets ++;
		priv->stats.rx_bytes += ip_len;
	}else 
	{
		priv->stats.rx_errors ++;
		priv->stats.rx_missed_errors ++;
	}
	priv->rx_skb = NULL;	// the uplyer will free skb, it's not our job, so forget it 
	return;
}

void soc_dma_process_done_pkt(unsigned long para)
{
	int ip_len= 0;
	unsigned int RxStat,dmaRxPort,pktRxLength;
	unsigned char rx_port,istimeout;
	unsigned char *data = NULL;
	unsigned long time;
	uint16_t dest_type = KCOM_DEST_T_NULL;
	//unsigned long flags;

	struct net_device *dev = (struct net_device *)para;
	struct mac_eth_priv *priv = netdev_priv(dev);
	//eolt_error("Enter soc_dma_process_done_pkt..\n");

	//zjy add
	do{
		RxStat=dma_reg_read(priv->io_addr + DMA_RX_STATE); //
		pktRxLength = RxStat & 0xfff; //(total bytes+7)/8+2(include sop and eop of pkt).
		dmaRxPort = ((RxStat>>12) & 0x1); //0：PTP，1：OAM

		if(pktRxLength <= 0x2) 
		{ 
			eolt_error("soc_dma_process_done_pkt:pktRxLength(%d) pktRxPort(%d)\n", pktRxLength,dmaRxPort);
			return;
		}
		/*收到的数据帧结构为：私有包头(8 Bytes)+数据(8 Bytes对齐)+私有包尾(8 Bytes)。
		*ip_len如果不是8的整数倍，会在后面补0。ip_len是数据真实长度，不包含0。
		*接收数据帧总长度为 8 + (ip_len+7)/8 *8 + 8
		*包尾首地址为mac_rx_buf + 8 + (ip_len+7)/8 *8 */
		data = mac_rx_buf+8;
		ip_len = ((int)(*(mac_rx_buf+6) & 0x3F)<<8)+ *(mac_rx_buf+7); //pktRxLength =(ip_len+7)/8+2
		rx_port= (*(mac_rx_buf+6) >>6) + ((*(mac_rx_buf+5) & 0x0F)<<2);

		if(ip_len <= 0) 
		{ 
			eolt_error("soc_dma_process_done_pkt: ip_len(%d)\n", ip_len);
			return;
		}
		
		if(rx_port==net_port)
		{
			pkt_netif_rx(dev,data,ip_len,0);
		}
		else
		{       
			dest_type = filter_match_rx_pkt(data,ip_len); 
			
			switch(dest_type)
			{
				case KCOM_DEST_T_NETIF: 
					pkt_netif_rx(vir_ndev,data,ip_len,1);
					break;
				case KCOM_DEST_T_API:  /*netlink,send message to user directly,*/
					send_usrmsg(mac_rx_buf,(ip_len+7)/8 *8 + 16);//include SOP,EOP 
					break;
				default:
					break;
			}
		}
		time = 0;
		istimeout = 1;
		do{
			if((dma_reg_read(priv->io_addr + DMA_STATUS)) & 0x2) //poll rx_req_status
			{
				dma_rx_start(dev);
				break;
			}else
			{
				time++;
			}
		}while(time < 10);
		if(time >= 10)
		{
			dma_reg_write(priv->io_addr + DMA_INT_MASK, (~(IRQ_DMA_RX_REQ_MASK | IRQ_DMA_TX_END_MASK) & IRQ_DMA_RX_END_MASK)); //start rx_req
			if((dma_reg_read(priv->io_addr + DMA_STATUS)) & 0x2) //poll rx_req_status
			{
				dma_reg_write(priv->io_addr + DMA_INT_MASK, ((~IRQ_DMA_TX_END_MASK) & (IRQ_DMA_RX_REQ_MASK | IRQ_DMA_RX_END_MASK))); //关rx_req中断
				dma_rx_start(dev);
			}
		}
	}while(istimeout == 0);
}

static struct net_device_stats *get_stats(struct net_device *dev)
{
	struct mac_eth_priv *priv = netdev_priv(dev);
	unsigned long flags;
//	u8 late_coll, single_coll, mult_coll;

	//printk("#enter %s\n",__FUNCTION__);
	spin_lock_irqsave(&priv->lock, flags);
	/* The chip only need report frame silently dropped. */
#if 0	
	dev->stats.rx_missed_errors	+= dma_reg_read(priv->io_addr + FBHM_RX_DROPPKT);
	dev->stats.tx_packets += dma_reg_read(priv->io_addr + FBHM_TX_PKTS);
	dev->stats.rx_packets += dma_reg_read(priv->io_addr + FBHM_RX_PKTBYTES);

/*
	mult_coll = ioread8(ioaddr + StatsMultiColl);
	np->xstats.tx_multiple_collisions += mult_coll;
	single_coll = ioread8(ioaddr + StatsOneColl);
	np->xstats.tx_single_collisions += single_coll;
	late_coll = ioread8(ioaddr + StatsLateColl);
	priv->xstats.tx_late_collisions += late_coll;
	dev->stats.collisions += mult_coll + single_coll + late_coll;

	priv->xstats.tx_deferred += ioread8(ioaddr + StatsTxDefer);
	priv->xstats.tx_deferred_excessive += ioread8(ioaddr + StatsTxXSDefer);
	priv->xstats.tx_aborted += ioread8(ioaddr + StatsTxAbort);
	priv->xstats.tx_bcasts += ioread8(ioaddr + StatsBcastTx);
*/	
//	priv->xstats.rx_bcasts += dma_reg_read(priv->io_addr + FBHM_RX_BCPKT);
//	priv->xstats.rx_mcasts += dma_reg_read(priv->io_addr + FBHM_RX_MULTIPKT);

	dev->stats.tx_bytes += dma_reg_read(priv->io_addr + FBHM_TX_PKTBYTES);
	dev->stats.rx_bytes += dma_reg_read(priv->io_addr + FBHM_RX_PKTBYTES);
#endif
	spin_unlock_irqrestore(&priv->lock, flags);

//	return &dev->stats;
	return &priv->stats;
}
static int
pkt_filter_create(kcom_msg_filter_create_t *kmsg)
{
	struct list_head *list;
	pkt_filter_t *filter, *lfilter;
	int found, id;
	unsigned long flags;
	kmsg->hdr.type = KCOM_MSG_TYPE_RSP;

	switch (kmsg->filter.type) {
	case KCOM_FILTER_T_RX_PKT:
		break;
	default:
		kmsg->hdr.status = KCOM_E_PARAM;
		return sizeof(kcom_msg_hdr_t);
	}

	filter = kmalloc(sizeof(*filter), GFP_KERNEL);
	if (filter == NULL) {
		kmsg->hdr.status = KCOM_E_PARAM;
		return sizeof(kcom_msg_hdr_t);
	}
	memset(filter, 0, sizeof(*filter));
	memcpy(&filter->kf, &kmsg->filter, sizeof(filter->kf));
	/* Find available ID */
	found = 1;
	id = 0;
	spin_lock_irqsave(&filter_lock, flags);
	while (found && ++id < KCOM_FILTER_MAX) {
		found = 0;
		list_for_each(list, &_filter_list) {
			lfilter = (pkt_filter_t *)list;
			if (id == lfilter->kf.id) {
				found = 1;
				break;
			}
		}
	}
	if (found) {
		/* Too many filters */
		spin_unlock_irqrestore(&filter_lock, flags);
		kmsg->hdr.status = KCOM_E_RESOURCE;
		kfree(filter);
		return sizeof(kcom_msg_hdr_t);
	}
	filter->kf.id = id;

	/* Add according to priority */
	found = 0;
	list_for_each(list, &_filter_list) {
		lfilter = (pkt_filter_t *)list;
		if (filter->kf.priority < lfilter->kf.priority) {
			list_add_tail(&filter->list, &lfilter->list);
			found = 1;
			break;
		}
	}
	if (!found) {
	    list_add_tail(&filter->list, &_filter_list);
	}
	spin_unlock_irqrestore(&filter_lock, flags);

	kmsg->filter.id = filter->kf.id;
	//printk("Created filter ID %d (%s).\n", filter->kf.id, filter->kf.desc);
	return sizeof(kcom_msg_hdr_t);
}

static int
pkt_filter_destroy(kcom_msg_filter_destroy_t *kmsg)
{
    pkt_filter_t *filter;
    struct list_head *list;
    int found;
	unsigned long flags;

    kmsg->hdr.type = KCOM_MSG_TYPE_RSP;

    found = 0;
	spin_lock_irqsave(&filter_lock, flags);
    list_for_each(list, &_filter_list) {
        filter = (pkt_filter_t *)list;
        if (kmsg->hdr.id == filter->kf.id) {
            found = 1;
            break;
        }
    }

    if (!found) {
        kmsg->hdr.status = KCOM_E_NOT_FOUND;
		spin_unlock_irqrestore(&filter_lock, flags);
        return sizeof(kcom_msg_hdr_t);
    }

    list_del(&filter->list);
    //printk("Removing filter ID %d.\n", filter->kf.id);
    kfree(filter);
	spin_unlock_irqrestore(&filter_lock, flags);

    return sizeof(kcom_msg_hdr_t);
}

static int
pkt_filter_list(kcom_msg_filter_list_t *kmsg)
{
    pkt_filter_t *filter;
    struct list_head *list;
    int idx;
	unsigned long flags;

    kmsg->hdr.type = KCOM_MSG_TYPE_RSP;

    idx = 0;
	spin_lock_irqsave(&filter_lock, flags);
    list_for_each(list, &_filter_list) {
        filter = (pkt_filter_t *)list;
        kmsg->id[idx] = filter->kf.id;
        idx++;
    }
	spin_unlock_irqrestore(&filter_lock, flags);
    kmsg->fcnt = idx;
    return sizeof(*kmsg) - sizeof(kmsg->id) + (idx * sizeof(kmsg->id[0]));
}

static int
pkt_filter_get(kcom_msg_filter_get_t *kmsg)
{
    pkt_filter_t *filter;
    struct list_head *list;
    int found;
	unsigned long flags;

    kmsg->hdr.type = KCOM_MSG_TYPE_RSP;

    found = 0;
	spin_lock_irqsave(&filter_lock, flags);
    list_for_each(list, &_filter_list) {
        filter = (pkt_filter_t *)list;
        if (kmsg->hdr.id == filter->kf.id) {
            found = 1;
            break;
        }
    }

    if (!found) {
        kmsg->hdr.status = KCOM_E_NOT_FOUND;
		spin_unlock_irqrestore(&filter_lock, flags);
        return sizeof(kcom_msg_hdr_t);
    }

    memcpy(&kmsg->filter, &filter->kf, sizeof(kmsg->filter));
	spin_unlock_irqrestore(&filter_lock, flags);

    return sizeof(*kmsg);
}

static int xy1000_filter_do_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
{
	int rlen,ret=0;
	kcom_msg_t kmsg;

	ret = copy_from_user(&kmsg, ifr->ifr_data, sizeof(kcom_msg_t));
	if(ret) {
		printk("%s: copy from user failed\n", __func__);
		return -EFAULT;
	}

	switch (kmsg.hdr.opcode) {
	case KCOM_M_FILTER_CREATE:   //澧炲姞 filter
		rlen = pkt_filter_create(&kmsg.filter_create);
		break;
	case KCOM_M_FILTER_DESTROY:   //鍒犻櫎 filter
		rlen = pkt_filter_destroy(&kmsg.filter_destroy);		
		break;
 	case KCOM_M_FILTER_LIST:   //鏌ョ湅 list of filter IDs
		rlen = pkt_filter_list(&kmsg.filter_list);
		break;
	case KCOM_M_FILTER_GET:	 //鏌ョ湅 filter
		rlen = pkt_filter_get(&kmsg.filter_get);
		break;
	default:
		/* do nothing */
		return -ERANGE;
	}
	ret = copy_to_user(ifr->ifr_data, &kmsg, sizeof(kcom_msg_t));
	return 0;
}


int xy1000_net_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
{
	int ret=0;
	//struct mac_eth_priv *priv=netdev_priv(dev);
	if (!netif_running(dev))
		return -EINVAL;

	if(cmd == SIOCDEVPRIVATE){
		ret = xy1000_filter_do_ioctl(dev, ifr, cmd);
	}

	return ret;
}

int fbhm_change_mtu(struct net_device *dev, int new_mtu)
{
	if (new_mtu < 68 || new_mtu > FBHM_MAC_MAX_LEN)
		return -EINVAL;
	dev->mtu = new_mtu;
	return 0;
}

static const struct net_device_ops fbhm_netdev_ops = {
	.ndo_open		= fbhm_mac_eth_open,
	.ndo_stop		= fbhm_stop,	
	.ndo_start_xmit		= fbhm_mac_eth_tx,
	.ndo_get_stats 		= get_stats,
	.ndo_tx_timeout		= fbhm_timeout,
//	.ndo_set_rx_mode	= fbhm_hash_table,   //锟斤拷锟斤拷锟介播锟斤拷址 
	.ndo_do_ioctl		= xy1000_net_eth_ioctl,
	.ndo_change_mtu		= fbhm_change_mtu,    //锟睫革拷mtu值锟斤拷mtu锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷莅锟斤拷锟叫?//	.ndo_set_features	= fbhm_set_features,
//	.ndo_validate_addr	= eth_validate_addr,
	.ndo_set_mac_address	= fbhm_eth_mac_addr,
#ifdef CONFIG_NET_POLL_CONTROLLER
//	.ndo_poll_controller	= fbhm_poll_controller,
#endif
};


#define CONFIG_OF 1

#ifdef CONFIG_OF
static const struct of_device_id fbhm_of_matches[] = {
	{ .compatible = "fsl,fsl-mac", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, fbhm_of_matches);
#endif


/*
 * Search FBHM board, allocate space and register it
 */
#if 0
static uint8_t msg_send[64]={
	0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x02,0xaa,0xbb,0xcc,0x38,0x08,0x06,	  //报文报头，14字节
	0x0,0x1,0x8,0x0,0x6,0x4,0x0,0x1,0x0,0x2,0xaa,0xbb,0xcc,0x38,0xa,0xa0,
	0x1e,0xef,0x0,0x0,0x0,0x0,0x0,0x0,0xa,0xa0,0x1e,0xea}; 					 //报文内容，28字节
static uint32_t msg_num=8;
module_param_array(msg_send,byte,&msg_num,0664);
#endif

static struct mac_eth_priv *priv_copy_to_vir=NULL;
#define fbhm_mac_vir 1
#if fbhm_mac_vir
static void	pdev_net_vir_release(struct device *dev)
{
	
}
static struct platform_device pdev_net_vir={
	.name = "fsl,fsl-mac_vir",
	.id= -1,
	.dev = {
		.release = pdev_net_vir_release,
	},
};

static int fbhm_probe_vir(struct platform_device *pdev)
{
	struct net_device *ndev;
	struct mac_eth_priv *priv; 
	int ret = 0;
	//int iosize;
	//const struct of_device_id *of_id;

	if((device_is_present==0) || (priv_copy_to_vir==NULL))
	{
		return -EAGAIN;
	}

	/* Init network device */
#if 0
	ndev = alloc_etherdev(sizeof(struct mac_eth_priv));
#else
	ndev = alloc_netdev(sizeof(struct mac_eth_priv), "vir%d", 0,ether_setup);
#endif
	if(!ndev) 
	{
		eolt_error("xy1000_net: alloc_netdev failed, return\n");
		return -1;
	}

    SET_NETDEV_DEV(ndev, &pdev->dev);

    priv = netdev_priv(ndev);
	memcpy(priv,priv_copy_to_vir,sizeof(struct mac_eth_priv));
	priv->dev = &pdev->dev;
	priv->ndev = ndev;
	memcpy(ndev->dev_addr, host_addr_vir, 6);
	ether_setup(ndev);
    ndev->netdev_ops    = &fbhm_netdev_ops;
	ndev->watchdog_timeo    = 0;

	platform_set_drvdata(pdev, ndev);
	
	if ((ret = register_netdev(ndev)) < 0) 
	{
	    eolt_error("xy1000_net: error %i registering device \"%s\"\n", ret, ndev->name);
	    goto out;
	}
	vir_ndev = ndev;

	return 0;

out:
	printk("##probe err (%d).\n", ret);
	free_netdev(ndev);
	return ret;
}

static int fbhm_drv_remove_vir(struct platform_device *pdev)
{
	struct net_device *ndev = platform_get_drvdata(pdev);

	unregister_netdev(ndev);

	free_netdev(ndev);		/* free device structure */

	dev_dbg(&pdev->dev, "released and freed device\n");

	return 0;
}

static struct platform_driver fbhm_driver_vir = {
	.driver	= {
		.name    = "fsl,fsl-mac_vir",
		//.of_match_table = of_match_ptr(fbhm_of_matches_vir),
	},
	.probe   = fbhm_probe_vir,
	.remove  = fbhm_drv_remove_vir,
};
#endif
static void set_words(uint64_t phy_addr,uint32_t N,uint32_t start,uint32_t end,uint32_t val)
{
	uint32_t p_tmp[64];
	volatile uint32_t *reg;
	int i;
	reg = ioremap(phy_addr, 4*N);
	if (reg == NULL) {
		printk("#ioremap  error\n");
		return;
	}
	for(i=0;i<N;i++)
	{
		*(p_tmp+i) = *(reg+i);
	}
	for(i=0;i<N;i++)
	{
		if((i==start/32) && (i==end/32))
		{
			*(p_tmp+i) &= ~ BITS(start%32,end%32);
			*(p_tmp+i) |= ((val << start%32) & BITS(start%32,end%32)); 
		}
		else
		{}
		*(reg+i)=*(p_tmp+i);
	}
	iounmap(reg);
	//free(p_tmp);
}
static void fbhm_setpp(void)
{
	set_words(I_VT_PORT_SRM_0 ,5,146,146,1); //FWD_VLD=1
	set_words(I_VT_PORT_SRM_0 ,5,147,152,31);//OUT_LPORT=31
	set_words(I_NET_PORT_SRM_0,4,2,2,0);     //STP_CHK_EN=0
	set_words(I_NET_PORT_SRM_0,4,4,4,0);     //BRG_EN=0
	set_words(E_ACL_LOOP_CTL,1,7,7,1);       //LOOP_BYPASS=1
	//set_words(TRAFFIC_DROP_REG_ADM_CTRL,7,128,159,0xffffffff); //SPORT_ADM_ENABLE_31TO0f=0xffffffff
	//set_words(TRAFFIC_DROP_REG_ADM_CTRL,7,195,195,0); //PKT_RED_DROP_INDf=0
	set_words(E_EE_LOOP_CTL ,1,7,7,1);
	set_words(E_PF_LOOP_CTL ,1,7,7,1);
	set_words(E_PF_LOOP_CTL ,1,15,15,1);
	set_words(E_POL_LOOP_CTL,1,7,7,1);
	set_words(E_DST_LOOP_CTL,1,7,7,0);
	set_words(I_ACL_LOOP_CTL,1,7,7,1);
	set_words(I_FWD_LOOP_CTL,1,7,7,1);
	set_words(I_FWD_LOOP_CTL,1,15,15,1);
	set_words(I_FWD_LOOP_CTL,1,23,23,1);
	set_words(I_NET_LOOP_CTL,1,7,7,1);
	set_words(I_NET_LOOP_CTL,1,15,15,1);
	set_words(I_POL_LOOP_CTL,1,7,7,1);
	set_words(I_POL_LOOP_CTL,1,15,15,1);
	set_words(I_PR0_LOOP_CTL,1,7,7,1);
	set_words(I_VT_LOOP_CTL ,1,7,7,0);       //LOOP_BYPASS=0
	set_words(I_VT_LOOP_CTL ,1,15,15,0);     //LOOP_BYPASS=0
	set_words(I_DST_LOOP_CTL,1,7,7,0);       //LOOP_BYPASS=0
}

static int
fbhm_probe(struct platform_device *pdev)
{
//	struct fbhm_plat_data *pdata = dev_get_platdata(&pdev->dev);
//	struct board_info *db;	/* Point a board information structure */
	struct net_device *ndev;
//	struct device_node *dn = pdev->dev.of_node;
//	struct device *dev = &pdev->dev;
	struct mac_eth_priv *priv; 
//	const unsigned char *mac_src;
	int ret = 0;
	int iosize;

	const struct of_device_id *of_id;

	//printk("xy1000_net.ko v1.0\n");
/*	
	mac_dev = alloc_netdev(sizeof(struct mac_eth_priv), "epon_mac%d", 0,mac_eth_init);
	if(!mac_dev) 
	{
		eolt_error("xy1000_net: alloc_netdev failed, return\n");
		return -1;
	}
*/
	/* Init network device */
	ndev = alloc_etherdev(sizeof(struct mac_eth_priv));
	if (!ndev)
		return -1;	

//	mac_eth_init(ndev);	
	eth_ndev=ndev;

    SET_NETDEV_DEV(ndev, &pdev->dev);
    priv = netdev_priv(ndev);
	memset(priv, 0, sizeof(struct mac_eth_priv));
	priv->dev = &pdev->dev;
	priv->ndev = ndev;
	spin_lock_init(&priv->lock);
	spin_lock_init(&tx_lock);
	spin_lock_init(&filter_lock);
	memcpy(ndev->dev_addr, host_addr, 6);
	
	tasklet_init(&priv->fbhm_irq_task, soc_dma_process_done_pkt, (unsigned long)ndev);

	of_id = of_match_device(fbhm_of_matches, &pdev->dev);
	if (of_id) {
		pdev->id_entry = of_id->data;
	} else {
		pr_err("Failed to find the right device id.\n");
		free_netdev(ndev);
		return -ENOMEM;
	}
   
	priv->addr_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

	iosize = resource_size(priv->addr_res);
	printk("addr_res 0x%llx, size 0x%x\n",priv->addr_res->start,iosize);
	priv->addr_req = request_mem_region(priv->addr_res->start, iosize,
					  pdev->name);

	if (priv->addr_req == NULL) {
		printk("#request_mem_region  error\n");
		dev_err(priv->dev, "cannot claim address reg area\n");
		ret = -EIO;
		goto out;
	}

	priv->io_addr = ioremap(priv->addr_res->start, iosize);
	if (priv->io_addr == NULL) {
		printk("#ioremap  error\n");
		dev_err(priv->dev, "failed to ioremap address reg\n");
		ret = -EINVAL;
		goto out;
	}
 
 	dma_addr = NULL;
	mac_tx_buf = NULL;
	mac_rx_buf = NULL;
	//dma_addr = (unsigned char *)dma_alloc_coherent(dev, DMA_PKT_MAX_SIZE*2, &dma_handler, GFP_KERNEL | GFP_DMA);
	/*0x40000000 ~ 0x40008000*/
	dma_handler = 0x40000000;
	dma_addr = ioremap(0x40000000, DMA_PKT_MAX_SIZE*2);
	if(!dma_addr)
	{
		printk("###dma_alloc failed###\n");
	}
	//printk("##MAC_DMA_TOTAL_SIZE (0x%08x).\n", (u32)MAC_DMA_TOTAL_SIZE);
	mac_rx_buf = dma_addr;
	mac_tx_buf = dma_addr + DMA_PKT_MAX_SIZE; 
	dma_rx_handler = dma_handler;
	dma_tx_handler = dma_handler + DMA_PKT_MAX_SIZE;
	memset(mac_tx_buf, 0x00, DMA_PKT_MAX_SIZE);
 
	priv->tx_end_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
	priv->rx_end_irq = irq_of_parse_and_map(pdev->dev.of_node, 1);
	priv->rx_req_irq = irq_of_parse_and_map(pdev->dev.of_node, 2);
	printk("pkt dma tx_end_irq %d\n", priv->tx_end_irq);
	printk("pkt dma rx_end_irq %d\n", priv->rx_end_irq);
	printk("pkt dma rx_req_irq %d\n", priv->rx_req_irq);

    if ((ret = request_irq(priv->tx_end_irq, fbhm_interrupt_tx_end, 0, "fbhm-mac_tx_end", ndev)) != 0)
	{
		printk("#request_tx_end_irq  error,ret:%d\n",ret);		
		//tasklet_disable(&priv->fbhm_irq_task);	
		//return -EAGAIN;
		goto out;
	}

	if ((ret = request_irq(priv->rx_end_irq, fbhm_interrupt_rx_end, 0, "fbhm-mac_rx_end", ndev)) != 0)
	{
		printk("#request_rx_end_irq  error,ret:%d\n",ret);
		
		goto out;
	}

	if ((ret = request_irq(priv->rx_req_irq, fbhm_interrupt_rx_req, 0, "fbhm-mac_rx_req", ndev)) != 0)
	{
		printk("#request_rx_req_irq  error,ret:%d\n",ret);		
		goto out;
	}
	//printk("####setup ether####\n");
	/*driver system function Pengfei added*/
	ether_setup(ndev);
    ndev->netdev_ops    = &fbhm_netdev_ops;
//    ndev->watchdog_timeo    = 5 * HZ;
	ndev->watchdog_timeo    = 0;

	platform_set_drvdata(pdev, ndev);

	if ((ret = register_netdev(ndev)) < 0) 
	{
	    eolt_error("xy1000_net: error %i registering device \"%s\"\n", ret, ndev->name);
		goto out;
	    return -1;
	}

	device_is_present = 1; // init success
	dma_reg_write(priv->io_addr + DMA_AXI_WR_CFG, 0x1000f); 		 //set rx
	dma_reg_write(priv->io_addr + DMA_AXI_RD_CFG, 0x1000f); 		 //set tx
	dma_reg_write(priv->io_addr + DMA_INT_MASK, ~(IRQ_DMA_TX_END_MASK | IRQ_DMA_RX_REQ_MASK));       //start tx_end
	fbhm_setpp();
#if 0
		struct sk_buff *skb;
		unsigned char *ptr;
		int lenth = 0x2a;
		skb = dev_alloc_skb(lenth+16); 
		if(skb == NULL) {			
			eolt_error("probe:allocate skb failed\n");
			return;
		}		
		skb_reserve (skb, 2); // 16bytes align, because EHTER_HEADER is 14bytes
		ptr = skb_put(skb, lenth);
		memcpy(ptr, msg_send, lenth); // don't need the last crc bytes			
		skb->dev = ndev;
		skb->len = lenth;
		fbhm_mac_eth_tx(skb, ndev);
#endif
//	priv->queue_pkt_len = 0;
/*netlink:for user apps to rx/tx pkt directly,don't go through tcp/ip stacks*/
    nlsk = (struct sock *)netlink_kernel_create(&init_net, NETLINK_DMA, &nl_cfg); /* create netlink socket */
    if(nlsk == NULL)
    {
        printk("netlink_kernel_create error !\n");
    }

	//printk("%s successfully end!\n",__FUNCTION__);
#if fbhm_mac_vir
	priv_copy_to_vir = priv;
	if(platform_device_register(&pdev_net_vir)!=0)
		printk("register dev err\n");
	if(platform_driver_register(&fbhm_driver_vir)!=0)
		printk("register drv err\n");
#endif
	return 0;

out:
//	dev_err(db->dev, "not found (%d).\n", ret);
	printk("##not found (%d).\n", ret);

	xy1000_net_eth_release(ndev);
	free_netdev(ndev);

	return ret;
}

static int
fbhm_drv_remove(struct platform_device *pdev)
{
	struct net_device *ndev = platform_get_drvdata(pdev);
	
	//printk("enter %s\n",__FUNCTION__);
	//kfree(pn11_d32_table);
#if fbhm_mac_vir
	priv_copy_to_vir = NULL;
	platform_device_unregister(&pdev_net_vir);
	platform_driver_unregister(&fbhm_driver_vir);
#endif
	
	unregister_netdev(ndev);

	xy1000_net_eth_release(ndev);
	free_netdev(ndev);		/* free device structure */

	dev_dbg(&pdev->dev, "released and freed device\n");

    if (nlsk){
        netlink_kernel_release(nlsk); /* release ..*/
        nlsk = NULL;
    }	
	return 0;
}


static struct platform_driver fbhm_driver = {
	.driver	= {
		.name    = "fsl-mac",
		.of_match_table = of_match_ptr(fbhm_of_matches),
	},
	.probe   = fbhm_probe,
	.remove  = fbhm_drv_remove,
};

module_platform_driver(fbhm_driver);


MODULE_AUTHOR("Pengfei Liu");
MODULE_DESCRIPTION("Xuanyuan FSL network driver");
MODULE_LICENSE("GPL");


