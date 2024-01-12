#ifndef _XY1000_ETH_H_
#define _XY1000_ETH_H_


#define EPON_OLT_MAC_MINOR 	24 //todo: tmp setting
#define MAC_SENDING_EXPIRES		(HZ/10) // todo: 1 seconds for expirestime

#define FBHM_MAC_MAX_LEN 9600

#define EPON_OLT_MAC_REG_BASE		(0xe0000000)
//#define EPON_OLT_MAC_REG_LEN		(0x10000) // 64k

#define EPON_OLT_MAC_REG_LEN	0x7C


/* ioctl () definitions */
#define EPON_OLT_MAC_IOCTL_MAGIC '?' /* This ioctl magic number is currently free. See /usr/src/linux/Documentation/ioctl-number.txt */

#define epon_olt_mac_ioctl_reg_read	_IOR(EPON_OLT_MAC_IOCTL_MAGIC, 0, unsigned long)  
#define epon_olt_mac_ioctl_reg_write  	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 1, struct olt_write_reg) //_IOW: user writes. 
#define epon_olt_mac_ioctl_reg_writebit	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 3, struct olt_write_reg_bit) // sizeof(struct olt_write_reg_bit) is wrong type
#define epon_olt_mac_ioctl_cmd		_IO(EPON_OLT_MAC_IOCTL_MAGIC, 2) // no para
#define epon_olt_mac_ioctl_start_dma_read	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 4, int) // _IOW: user writes.
#define epon_olt_mac_ioctl_start_dma_write  	_IOW(EPON_OLT_MAC_IOCTL_MAGIC, 5, int)

/* When rx packets,interrupt will be used: 
	if only use interrupt without poll, TASKLET can be defined;
	if use interrupt and poll,please don't define TASKLET, then workqueue will work, but have a very low efficency */
#define TASKLET


/* Ethernet related macros */
struct mac_eth_priv 
{	
	int mac_eth_open; 						//0: unopen, 1: opened
	int status;
	int rx_int_enabled;
	int tx_packetlen;
	unsigned char *tx_packetdata;

	struct resource	*addr_res;
    struct resource	*addr_req;   			/* resources requested */
	void __iomem	*io_addr;
	
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

#define FBHM_REGINTF_BLOCK       		(0x100)
#define FBHM_PCIEMDA_BLOCK       		(0x200)

#define FBHM_PCIEDMA_DMACOUNTER  		(FBHM_PCIEMDA_BLOCK + 0x1b0)
#define FBHM_PCIEDMA_INTERUPT    		(FBHM_PCIEMDA_BLOCK + 0x1a0)
#define FBHM_PCIEDMA_PCIEDEBUG   		(FBHM_PCIEMDA_BLOCK + 0x1c0)
#define FBHM_PCIEDMA_PCIEDEBUGCNT 		(FBHM_PCIEMDA_BLOCK + 0x1e0)
#define FBHM_PCIEDMA_PKTINTFCTL   		(FBHM_PCIEMDA_BLOCK + 0x2c)
#define FBHM_PCIEDMA_PKTRXADDR    		(FBHM_PCIEMDA_BLOCK + 0x18)
#define FBHM_PCIEDMA_PKTRXBUFFADDR  	(FBHM_PCIEMDA_BLOCK + 0x28)
#define FBHM_PCIEDMA_PKTRXCTL  			(FBHM_PCIEMDA_BLOCK + 0x10)
#define FBHM_PCIEDMA_PKTRXPRBS   		(FBHM_PCIEMDA_BLOCK + 0x30)
#define FBHM_PCIEDMA_PKTRXPROC   		(FBHM_PCIEMDA_BLOCK + 0x34)
#define FBHM_PCIEDMA_PKTRXSTAT    		(FBHM_PCIEMDA_BLOCK + 0x20)
#define FBHM_PCIEDMA_PKTTXADDR    		(FBHM_PCIEMDA_BLOCK + 0xc)
#define FBHM_PCIEDMA_PKTTXCOUNTSTAT 	(FBHM_PCIEMDA_BLOCK + 0x38)
#define FBHM_PCIEDMA_PKTTXCTL   		(FBHM_PCIEMDA_BLOCK + 0x8)
#define FBHM_PCIEDMA_PKTTXSTAT   		(FBHM_PCIEMDA_BLOCK + 0x1c)

#define FBHM_REGINTF_CHIPINFO    		(FBHM_REGINTF_BLOCK + 0x0)
#define FBHM_REGINTF_FIFOTHRESHOLD  	(FBHM_REGINTF_BLOCK + 0x20)
#define FBHM_REGINTF_INTERRUPT    		(FBHM_REGINTF_BLOCK + 0x10)
#define FBHM_REGINTF_READERRORADDRESS	(FBHM_REGINTF_BLOCK + 0x28)


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


// virt addr of DMA buf used for TX & RX
unsigned char *dma_addr;
unsigned char *dma_tx_buf; 
unsigned char *dma_rx_buf;
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



#define DMA_PKT_MAX_SIZE 0x4000

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

#define INVISIBLE_CFG		       0x40

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

//TODO:  tmp mac address define here
unsigned char host_addr[6] = { 0x00, 0x02, 0xaa, 0xbb, 0xcc, 0x38 }; 
int fh_net_initialize(bd_t *bis);

#endif

