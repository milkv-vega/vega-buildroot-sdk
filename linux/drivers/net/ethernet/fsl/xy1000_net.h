/************************************************************
  Copyright (C), 2010-2011, FiberHome.
  FileName: 		xy1000_net.h
  Author:		zhenxin.xie    
  Version : 		1.0.0		 
  Date: 			2011-01-13
  Description:	   
				EPON OLT FPAG Project: driver header file for MAC module.
				This is base on the new DMA driver.
				
				This file implements the two parts functions
				1. provides standard open/read/write/ioctl.. files operation interface for application to call
				2. provides virtual mac driver and process Skb packets, upper will see it as a virtual network adapter.
				
  History:
	<author>	<time>		<version >		<desc>
      zhenxin.xie  2011-01-13	  1.0.0 			codes before sumbit to SVN for the ending of OLT FPGA Project
	  
***********************************************************/ 
#ifndef _EPON_OLT_MAC_H_
#define _EPON_OLT_MAC_H_


#define EPON_OLT_MAC_MINOR 	24 //todo: tmp setting
#define MAC_SENDING_EXPIRES		(HZ/10) // todo: 1 seconds for expirestime

#define FBHM_MAC_MAX_LEN 9600

#define EPON_OLT_MAC_REG_BASE		(0xe0000000)
//#define EPON_OLT_MAC_REG_LEN		(0x10000) // 64k

#define EPON_OLT_MAC_REG_LEN	0x7C


/* ioctl () definitions */
#define EPON_OLT_MAC_IOCTL_MAGIC '?' /* This ioctl magic number is currently free. See /usr/src/linux/Documentation/ioctl-number.txt */

#define xy1000_net_ioctl_reg_read	_IOR(EPON_OLT_MAC_IOCTL_MAGIC, 0, unsigned long)  
#define xy1000_net_ioctl_reg_write  	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 1, struct olt_write_reg) //_IOW: user writes. 
#define xy1000_net_ioctl_reg_writebit	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 3, struct olt_write_reg_bit) // sizeof(struct olt_write_reg_bit) is wrong type
#define xy1000_net_ioctl_cmd		_IO(EPON_OLT_MAC_IOCTL_MAGIC, 2) // no para
#define xy1000_net_ioctl_start_dma_read	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 4, int) // _IOW: user writes.
#define xy1000_net_ioctl_start_dma_write  	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 5, int)

/* When rx packets,interrupt will be used: 
	if only use interrupt without poll, TASKLET can be defined;
	if use interrupt and poll,please don't define TASKLET, then workqueue will work, but have a very low efficency */
#define TASKLET


/* Ethernet related macros */
struct mac_eth_priv 
{	
	int mac_eth_open; //0: unopen, 1: opened
	struct net_device_stats stats;
	int status;
	int rx_int_enabled;
	int tx_packetlen;
	unsigned char *tx_packetdata;
	struct sk_buff *rx_skb;
	struct sk_buff *tx_skb;

#ifdef TASKLET
	struct tasklet_struct fbhm_irq_task;
#else
	struct work_struct  rx_work;
#endif

#if 0
	/* ethtool extra stats */
	struct {
		u64 tx_multiple_collisions;
		u64 tx_single_collisions;
		u64 tx_late_collisions;
		u64 tx_deferred;
		u64 tx_deferred_excessive;
		u64 tx_aborted;
		u64 tx_bcasts;
		u64 rx_bcasts;
		u64 tx_mcasts;
		u64 rx_mcasts;
	} xstats;
#endif

	struct resource	*addr_res;
    struct resource	*addr_req;   /* resources requested */
	void __iomem	*io_addr;
	
//	void __iomem *sysctrl_regs;
	void __iomem *sysclk_regs;
	void __iomem *sysrst_regs;

	u16      irq;
	u16		 tx_end_irq;
	u16 	 rx_end_irq;
	u16		 rx_req_irq;

    struct device   *dev;

    struct net_device  *ndev;
    int		ip_summed;
	u16		tx_pkt_cnt;
	u16		queue_pkt_len;
    u16		queue_ip_summed;
	
	spinlock_t lock;	
};

/* although the registers are 16 bit, they are 32-bit aligned.
 */
#define SOC_BLK_MAC (0x400)


#define FBHM_REV             		 (SOC_BLK_MAC + 0x00)
#define FBHM_MAC_CNTL            	 (SOC_BLK_MAC + 0x04)
#define FBHM_PHY_CNTL             	 (SOC_BLK_MAC + 0x08)
#define FBHM_PORT_STATUS             (SOC_BLK_MAC + 0x0C)
#define FBHM_MAC_0             		 (SOC_BLK_MAC + 0x10)
#define FBHM_MAC_1                   (SOC_BLK_MAC + 0x14)
#define FBHM_INTR_STATUS             (SOC_BLK_MAC + 0x18)
#define FBHM_INTR_MASK               (SOC_BLK_MAC + 0x1C)
#define FBHM_MDIO_CNTL               (SOC_BLK_MAC + 0x20)
#define FBHM_MDIO_DATA               (SOC_BLK_MAC + 0x24)
#define FBHM_FRM_LENGTH              (SOC_BLK_MAC + 0x28)
#define FBHM_PAUSE_QUANT             (SOC_BLK_MAC + 0x2C)
#define FBHM_PREAMBLE_LEN            (SOC_BLK_MAC + 0x30)
#define FBHM_MIN_IFG                 (SOC_BLK_MAC + 0x34)
#define FBHM_RX_PKTBYTES             (SOC_BLK_MAC + 0x38)
#define FBHM_RX_UNIPKT               (SOC_BLK_MAC + 0x3C)
#define FBHM_RX_MULTIPKT             (SOC_BLK_MAC + 0x40)
#define FBHM_RX_BCPKT                (SOC_BLK_MAC + 0x44)
#define FBHM_RX_FRGPKT               (SOC_BLK_MAC + 0x48)
#define FBHM_RX_UNDPKT               (SOC_BLK_MAC + 0x4C)
#define FBHM_RX_OVSZPKT              (SOC_BLK_MAC + 0x50)
#define FBHM_RX_FCSPKT               (SOC_BLK_MAC + 0x54)
#define FBHM_RX_FLOWPKT              (SOC_BLK_MAC + 0x58)
#define FBHM_RX_DROPPKT              (SOC_BLK_MAC + 0x5C)
#define FBHM_RX_PKT64                (SOC_BLK_MAC + 0x60)
#define FBHM_RX_PKT128               (SOC_BLK_MAC + 0x64)
#define FBHM_RX_PKT256               (SOC_BLK_MAC + 0x68)
#define FBHM_RX_PKT512               (SOC_BLK_MAC + 0x6C)
#define FBHM_RX_PKT1024              (SOC_BLK_MAC + 0x70)
#define FBHM_RX_PKT1522              (SOC_BLK_MAC + 0x74)
#define FBHM_TX_PKTBYTES             (SOC_BLK_MAC + 0x78)
#define FBHM_TX_PKTS                 (SOC_BLK_MAC + 0x7C)

//#define FBHM_GMAC_100M
#define FBHM_GMAC_1000M



#define FBHM_DMA_REV             		 0x00

#define FBHM_REGINTF_BLOCK       (0x100)
#define FBHM_PCIEMDA_BLOCK       (0x200)

#define FBHM_PCIEDMA_DMACOUNTER  (FBHM_PCIEMDA_BLOCK + 0x1b0)
#define FBHM_PCIEDMA_INTERUPT    (FBHM_PCIEMDA_BLOCK + 0x1a0)
#define FBHM_PCIEDMA_PCIEDEBUG   (FBHM_PCIEMDA_BLOCK + 0x1c0)
#define FBHM_PCIEDMA_PCIEDEBUGCNT (FBHM_PCIEMDA_BLOCK + 0x1e0)
#define FBHM_PCIEDMA_PKTINTFCTL   (FBHM_PCIEMDA_BLOCK + 0x2c)
#define FBHM_PCIEDMA_PKTRXADDR    (FBHM_PCIEMDA_BLOCK + 0x18)
#define FBHM_PCIEDMA_PKTRXBUFFADDR  (FBHM_PCIEMDA_BLOCK + 0x28)
#define FBHM_PCIEDMA_PKTRXCTL  (FBHM_PCIEMDA_BLOCK + 0x10)
#define FBHM_PCIEDMA_PKTRXPRBS   (FBHM_PCIEMDA_BLOCK + 0x30)
#define FBHM_PCIEDMA_PKTRXPROC   (FBHM_PCIEMDA_BLOCK + 0x34)
#define FBHM_PCIEDMA_PKTRXSTAT    (FBHM_PCIEMDA_BLOCK + 0x20)
#define FBHM_PCIEDMA_PKTTXADDR    (FBHM_PCIEMDA_BLOCK + 0xc)
#define FBHM_PCIEDMA_PKTTXCOUNTSTAT (FBHM_PCIEMDA_BLOCK + 0x38)
#define FBHM_PCIEDMA_PKTTXCTL   (FBHM_PCIEMDA_BLOCK + 0x8)
#define FBHM_PCIEDMA_PKTTXSTAT   (FBHM_PCIEMDA_BLOCK + 0x1c)

#define FBHM_REGINTF_CHIPINFO    (FBHM_REGINTF_BLOCK + 0x0)
#define FBHM_REGINTF_FIFOTHRESHOLD   (FBHM_REGINTF_BLOCK + 0x20)
#define FBHM_REGINTF_INTERRUPT    (FBHM_REGINTF_BLOCK + 0x10)
#define FBHM_REGINTF_READERRORADDRESS   (FBHM_REGINTF_BLOCK + 0x28)


/*PCIEDMA interrupt*/
#define   IRQ_PCIEDMA_PKT_TX_BUFF_FULL    0x00000001   /* Bit 0*/
#define   IRQ_PCIEDMA_PKT_TX_DMA_CONTROL_COMPLETE    0x00000002   /* Bit 1*/
#define   IRQ_PCIEDMA_PKT_RXDONE    0x00000004   /* Bit 2*/
#define   IRQ_PCIEDMA_PKT_RXALLDONE    0x00000008    /* Bit 3 */
#define   IRQ_PCIEDMA_PKT_RX_BUFF_FULL    0x00000010    /* Bit 4 */
#define   IRQ_PCIEDMA_PKTDMA_ERR    0x00000020    /* Bit 5 */
#define   IRQ_PCIEDMA_RX_STALL_ERR_SYNC    0x00000080    /* Bit 7 */

/*REGINTF interrupt*/
#define   IRQ_REGINTF_RDDATAFIFOUNDERRUN    0x00000001   /* Bit 0*/
#define   IRQ_REGINTF_RDDATAFIFOOVERRUN    0x00000002   /* Bit 1*/
#define   IRQ_REGINTF_ADDRFIFOUNDERRUN    0x00000004   /* Bit 2*/
#define   IRQ_REGINTF_ADDRFIFOOVERRUN    0x00000008   /* Bit 3*/
#define   IRQ_REGINTF_WRDATAFIFOUNDERRUN    0x00000010   /* Bit 4*/
#define   IRQ_REGINTF_WRDATAFIFOOVERRUN    0x00000020   /* Bit 5*/
#define   IRQ_REGINTF_CNTDMAFIFOUNDERRUN    0x00000040   /* Bit 6*/
#define   IRQ_REGINTF_CNTDMAFIFOOVERRUN    0x00000080   /* Bit 7*/
#define   IRQ_REGINTF_READERROROCCUR    0x00000100   /* Bit 8*/
#define   IRQ_REGINTF_TIMEOUTIRQ    0x00000200   /* Bit 9*/


typedef struct pkt_Rxstat_s {
        unsigned pktRxStartAddr;       /* Pkt Channel Packet Start Addr */

		unsigned  pktRxLength:24;                   /* Pkt Channel Packet length */
        unsigned  pktRxErr:1;                /* Pkt Data&Packet Err */
        unsigned  resv:7;                                 /* Don't care */

        unsigned pktRxPrbs;       /* Pkt Channel Packet Prbs */
} pkt_Rxstat_t;


/**********************************************************************
* MAC_DMA_INT_MASK_REG bit definitions
**********************************************************************/
#define MAC_DMA_RX_LEN_ERR_INT_EN		(1 << 2)  
#define MAC_DMA_RX_INT_EN		        (1 << 1)  
#define MAC_DMA_TX_INT_EN		        (1 << 0) 

/**********************************************************************
* MAC_DMA_INT_REG bit definitions
**********************************************************************/
#define MAC_DMA_RX_LEN_ERR_INT		(1 << 3)  
#define MAC_DMA_RX_INT		        (1 << 2)  
#define MAC_DMA_TX_INT		        (1 << 1) 

// phys addr of DMA buf used for TX & RX
dma_addr_t dma_handler;
dma_addr_t dma_rx_handler;
dma_addr_t dma_tx_handler;
//dma_addr_t dma_desc_handler;


// virt addr of DMA buf used for TX & RX
unsigned char *dma_addr;
unsigned char *mac_tx_buf; 
unsigned char *mac_rx_buf;
//unsigned char *mac_desc_buf;


#define DMA_RX_PACKET_SIZE    (2048)
//#define DMA_RX_PACKET_NUM     (512)
#define DMA_RX_PACKET_NUM     (2048)
#define DMA_RX_PER_DESC_SIZE  (12)
#define MAC_DMA_RX_SIZE		    (DMA_RX_PACKET_SIZE * DMA_RX_PACKET_NUM)
#define MAC_DMA_RX_DESC_SIZE  (DMA_RX_PER_DESC_SIZE * DMA_RX_PACKET_NUM)
#define DMA_TX_PACKET_SIZE    (2048)
//#define DMA_TX_PACKET_NUM     (512)
#define DMA_TX_PACKET_NUM     (2048)
#define MAC_DMA_TX_SIZE		    (DMA_TX_PACKET_SIZE * DMA_TX_PACKET_NUM)
#define MAC_DMA_RX_SIZE_RX_BUFF  (MAC_DMA_RX_SIZE / 1024)


#define MAC_DMA_TOTAL_SIZE	    (MAC_DMA_RX_SIZE + MAC_DMA_RX_DESC_SIZE + MAC_DMA_TX_SIZE)
//#define MAC_DMA_RX_SIZE		    0x100000
//#define MAC_DMA_TX_SIZE		    0x1800

/*DMA STAT*/
#define DS_PKT_TX_START_TST (0x00000001 << 24)     /* pktTxAdd */
#define DS_CHAIN_TX_DONE_TST (0x00000001 << 0)    /* pktTxActive */
#define DS_PKT_TX_BUFF_FULL_TST (0x00000001 << 1)    /* pktTxBuffFull */
#define DS_PKT_RX_DONE_TST   (0x00000001 << 25)   /* pktRxPktDone */
#define DS_CHAIN_RX_DONE_TST  (0x00000001 << 26)   /* pktRxAllDone */
#define DS_PKT_RX_BUFF_DONE_TST  (0x00000001 << 27)   /* pktRxBuffDone */
#define DS_PKT_RX_ENABLE_TST  (0x00000001 << 20)    /* pktRxEnable */

#define ETH_MINLEN	60
#define ETH_MAXLEN	2048 // tmp define here

//TODO:  tmp mac address define here
unsigned char host_addr[6] =     {0x00, 0x02, 0xaa, 0xbb, 0xcc, 0x38 }; 
unsigned char host_addr_vir[6]=  {0x00, 0x02, 0xaa, 0xbb, 0xcc, 0x48 };

#define DMA_PKT_MAX_SIZE 0x4000
/*xuanyuan pp register*/
#define I_VT_PORT_SRM_0  0x66080800    //words:5
#define I_NET_PORT_SRM_0 0x66101000    //words:4
#define E_ACL_LOOP_CTL   0x66480000    //words:1
#define E_EE_LOOP_CTL    0x66380000
#define E_PF_LOOP_CTL    0x66400004
#define E_POL_LOOP_CTL   0x66500000
#define E_DST_LOOP_CTL   0x66580000
#define I_ACL_LOOP_CTL   0x66200000
#define I_FWD_LOOP_CTL   0x66180020
#define I_NET_LOOP_CTL   0x66100010
#define I_POL_LOOP_CTL   0x66280000
#define I_PR0_LOOP_CTL   0x66000020
#define I_VT_LOOP_CTL    0x66080000
#define I_DST_LOOP_CTL   0x66300000
#define TRAFFIC_DROP_REG_ADM_CTRL   0x66860020  //word

#define BITS(start, end)       ((0xFFFFFFFFUL << (start)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(end))))

/*xuanyuan pkt_dam register*/
#define DMA_RX_ADDR            0x0
#define DMA_RX_STATE           0x4
#define DMA_RX_START           0x8
#define DMA_TX_ADDR            0xc
#define DMA_TX_CFG             0x10
#define DMA_TX_START           0x14
#define DMA_CFG                0x18
#define DMA_AXI_WR_CFG         0x1c
#define DMA_AXI_RD_CFG         0x20
#define DMA_BRESP_WD_CFG       0x24
#define DMA_TX_WD_CFG          0x28
#define DMA_RX_READY_WD_CFG    0x2c
#define DMA_RX_WD_CFG          0x30
#define DMA_STATUS             0x34
#define DMA_ALARM              0x38
#define DMA_INT_MASK           0x3c
/*pkt_dma interrupt*/
#define IRQ_DMA_RX_END    0x00000001   /* Bit 0*/
#define IRQ_DMA_RX_REQ    0x00000002   /* Bit 1*/
#define IRQ_DMA_TX_END    0x00000004   /* Bit 2*/
/*pkt_dma interrupt mask*/
#define IRQ_DMA_RX_REQ_MASK    0x00000001   /* Bit 0*/
#define IRQ_DMA_RX_END_MASK    0x00000002   /* Bit 1*/
#define IRQ_DMA_TX_END_MASK    0x00000004   /* Bit 2*/
/*pkt_dma alarm and error*/
#define DMA_RX_LEN_ERR_ALM          0x00000001   /* Bit 0*/
#define DMA_RX_LEN_ERR_INT_MASK     0x00000002   /* Bit 1*/
#define DMA_TX_LEN_ERR_ALM          0x00000004   /* Bit 2*/
#define DMA_TX_LEN_ERR_INT_MASK     0x00000008   /* Bit 3*/
#define DMA_RX_WD_ALM               0x00000010   /* Bit 4*/
#define DMA_RX_WD_INT_MASK          0x00000020   /* Bit 5*/
#define DMA_RX_READY_WD_ALM         0x00000080   /* Bit 7*/
#define DMA_RX_READY_WD_INT_MASK    0x00000200   /* Bit 9*/
#define DMA_TX_WD_ALM               0x00000400   /* Bit 10*/
#define DMA_TX_WD_INT_MASK          0x00000800   /* Bit 11*/

#define BYTES2WORDS(x)		(((x) + 3) / 4)
#define BITS2BYTES(x)		(((x) + 7) / 8)
#define BITS2WORDS(x)		(((x) + 31) / 32)

#define KCOM_FILTER_DESC_MAX 32
#define KCOM_FILTER_BYTES_MAX 256
#define KCOM_FILTER_WORDS_MAX BYTES2WORDS(KCOM_FILTER_BYTES_MAX)

#define KCOM_DEST_T_NULL        0
#define KCOM_DEST_T_NETIF       1
#define KCOM_DEST_T_API         2

#define KCOM_FILTER_T_RX_PKT    1

typedef struct {
    uint8_t id;     //filter ID
    uint8_t type;   //rx pkt filter, KCOM_FILTER_T_RX_PKT
    uint8_t priority;  //filter priority
    uint8_t reserved;
    char desc[KCOM_FILTER_DESC_MAX]; //filter descripter
    //uint32_t flags;
    uint16_t dest_type;  //send to netif or API
    uint16_t dest_id;
    //uint16_t mirror_type;
    //uint16_t mirror_id;
    //uint16_t oob_data_offset;
    //uint16_t oob_data_size;
    uint16_t pkt_data_offset;
    uint16_t pkt_data_size;
    union {
        uint8_t b[KCOM_FILTER_BYTES_MAX];
        uint32_t w[KCOM_FILTER_WORDS_MAX];
    } data;
    union {
        uint8_t b[KCOM_FILTER_BYTES_MAX];
        uint32_t w[KCOM_FILTER_WORDS_MAX];
    } mask;
} kcom_filter_t;

typedef struct {
    struct list_head list;
    unsigned long hits;
    kcom_filter_t kf;
} pkt_filter_t;

/* Message status codes*/
#define KCOM_E_NONE             0  /* No errors */
#define KCOM_E_PARAM            1  /* Invalid/unsupported parameter */
#define KCOM_E_RESOURCE         2  /* Out of memory or other resource */
#define KCOM_E_NOT_FOUND        3  /* Requested object not found */
/* Message types */
#define KCOM_MSG_TYPE_CMD       1  /* Command */
#define KCOM_MSG_TYPE_RSP       2  /* Command response */
#define KCOM_MSG_TYPE_EVT       3  /* Unsolicited event */
/* Message opcodes */
#define KCOM_M_FILTER_CREATE    21 /* Create Rx filter */
#define KCOM_M_FILTER_DESTROY   22 /* Destroy Rx filter */
#define KCOM_M_FILTER_LIST      23 /* Get list of Rx filter IDs */
#define KCOM_M_FILTER_GET       24 /* Get Rx filter info */

typedef struct kcom_msg_hdr_s {
    uint8_t type;     //cmd or cmd_resp
    uint8_t opcode;   //create,destroy,list,or get
    uint8_t seqno;
    uint8_t status; 
    uint8_t unit;
    uint8_t id;
    uint16_t reserved;
} kcom_msg_hdr_t;
/*
 * Create new packet filter.
 * The filter id will be assigned by the kernel module.
 */
typedef struct kcom_msg_filter_create_s {
    kcom_msg_hdr_t hdr;
    kcom_filter_t filter;
} kcom_msg_filter_create_t;

/*
 * Destroy packet filter.
 */
typedef struct kcom_msg_filter_destroy_s {
    kcom_msg_hdr_t hdr;
} kcom_msg_filter_destroy_t;

/*
 * Get list of currently defined packet filters.
 */
#define KCOM_FILTER_MAX  256

typedef struct kcom_msg_filter_list_s {
    kcom_msg_hdr_t hdr;
    uint32_t fcnt;
    uint8_t id[KCOM_FILTER_MAX];
} kcom_msg_filter_list_t;

/*
 * Get detailed packet filter information.
 */
typedef struct kcom_msg_filter_get_s {
    kcom_msg_hdr_t hdr;
    kcom_filter_t filter;
} kcom_msg_filter_get_t;

typedef union kcom_msg_s {
    kcom_msg_hdr_t hdr;
    kcom_msg_filter_create_t filter_create;
    kcom_msg_filter_destroy_t filter_destroy;
    kcom_msg_filter_list_t filter_list;
    kcom_msg_filter_get_t filter_get;
} kcom_msg_t;


/* check mac addr broadcast */
#define MAC_IS_BROADCAST(p)	((*(p) == 0xff) && (*((p) + 1) == 0xff) && \
		(*((p) + 2) == 0xff) &&  (*((p) + 3) == 0xff)  && \
		(*((p) + 4) == 0xff) && (*((p) + 5) == 0xff))

/* check mac addr is 01-00-5e-xx-xx-xx*/
#define MAC_IS_L3_MULTICAST(p) ((*((p) + 0) == 0x01) && \
			(*((p) + 1) == 0x00)   && \
			(*((p) + 2) == 0x5e))

/*check the mac addr is 0 in all bit*/
#define MAC_IS_ALL_ZEROS(p)   ((*(p) == 0) && (*((p) + 1) == 0) && \
	(*((p) + 2) == 0) && (*((p) + 3) == 0) && \
	(*((p) + 4) == 0) && (*((p) + 5) == 0))

/*check mac addr multicast*/
#define MAC_IS_MULTICAST(p)	((*((u8 *)((p) + 0)) & 0x01) ? (1) : (0))

#endif // _EPON_OLT_MAC_H_
