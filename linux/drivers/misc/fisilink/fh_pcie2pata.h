/************************************************************
  Copyright (C), 2011-2012, FiberHome.
  FileName: 		fh_pcie2pata.c
  Author:			zhenxin.xie    
  Version : 		1.0.0		 
  Date: 			2012-08-13
  Description:	   
  		PCIE to PATA driver head file. This driver provides a IDE interface and support max two cf cards work together.
					
  History:
  <author>	<time>		<version >		<desc>
  zhenxin.xie  2012-08-13	  1.0.0 	
	  
***********************************************************/
#ifndef _FH_PCIE2PATA_H_
#define _FH_PCIE2PATA_H_


/* driver related info define */
#define DRIVER_NAME "FH_PCIE2PATA_DRV"
// modified by zhenxin.xie on 2013-02-21: change fixed minor id to dynamic minor which alloced by linux os
#if 0 // old code
#define FH_PCIE2PATA_MINOR 25
#else
#define FH_PCIE2PATA_MINOR 53 //(MISC_DYNAMIC_MINOR)  MISC_DYNAMIC_MINOR:255
#endif
// end modified by zhenxin.xie

/* board relateed info define */
#define FOR_P2020_CPU
//#define FOR_P204X_CPU

/* ide controller related info define */
#define FH_PCIE2PATA_FREQ	100 // zhenxin.xie Note: Mhz

// add by zhenxin.xie on 2013-02-18: add IDE controller REV_ID for probing
#define FH_PCIE2PATA_IDE_CONTROLLER_REV_ID 0x10300
// end add by zhenxin.xie
#define PCI_VENDOR_ID_FH_PCIE2PATA 0x1172 // zhenxin.xie: vendor ID, TODO: change it if necessary

#define FH_PCIE2PATA_PCI_CONFIGREG_LEN 0x1000 // PCI configuration space len is 4kbytes
#define FH_PCIE2PATA_IDE_REG_LEN	0x100000

/*add by zjy, nuclei DMA reg struct*/
typedef struct {
    volatile uint32_t CG;
    volatile uint32_t EVENTID;
    volatile uint32_t MSRCADDR;
    volatile uint32_t MDSTADDR;
    volatile uint32_t MCTRL;
    volatile uint32_t RPT;
    volatile uint32_t MSIZE;
    volatile uint32_t RESERVE[57];
    volatile uint32_t CHX_IRQ_EN;
    volatile uint32_t CHX_IRQ_STAT;
    volatile uint32_t CHX_IRQ_CLR;
} DMA_TypeDef;
typedef enum
{
	ftrans_irq = 1,
	htrans_irq = 2,
	rep_err_irq= 4
}IRQ_type;

/* ----------------------- struct & macro definitions for Ioctl operations ------------------------------ */
struct pcie2pata_read_reg 
{
	unsigned int addr;
	unsigned int value;
	unsigned int busnum;
	unsigned int barnum;
};

struct pcie2pata_write_reg 
{
	unsigned int addr;
	unsigned int value;
	unsigned int busnum;
	unsigned int barnum;
};

struct pcie2pata_write_reg_bit 
{
	unsigned int addr;
	unsigned char msb;
	unsigned char lsb;
	unsigned int value;
};

struct pcie2pata_addr
{
	unsigned int pbase;
	unsigned int* vbase;
	unsigned int size;	
	unsigned int new_pbase;
	unsigned int* new_vbase;
};


struct pcie2pata_read_array_reg 
{
	unsigned int addr;
	unsigned int busnum;
	unsigned int barnum;
	unsigned int read_num;
	struct pcie2pata_addr dma_addr;
};

struct pcie2pata_write_array_reg 
{
	unsigned int addr;
	unsigned int busnum;
	unsigned int barnum;
	unsigned int write_num;
	struct pcie2pata_addr dma_addr;
};


struct pcie2pata_print
{
	unsigned int handle_num;
	unsigned int wake_num;
	unsigned int reg_value;	
	unsigned int intr_status;
};

/* ioctl for application related define */
#define FH_PCIE2PATA_IOCTL_MAGIC '?' /* This ioctl magic number is currently free. See /usr/src/linux/Documentation/ioctl-number.txt */

#define fh_pcie2pata_ioctl_read_reg	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 0, struct pcie2pata_read_reg)  
#define fh_pcie2pata_ioctl_write_reg  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 1, struct pcie2pata_write_reg) //_IOW: user writes. 
#define fh_pcie2pata_ioctl_addr  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 2, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_cleanaddr 	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 3, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_read_ide_reg	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 4, struct pcie2pata_read_reg)  
#define fh_pcie2pata_ioctl_write_ide_reg  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 5, struct pcie2pata_write_reg) //_IOW: user writes. 
#define fh_pcie2pata_ioctl_get_info  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 6, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_clean_info  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 7, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_get_dma  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 8, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_cleandma  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 9, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_get_page 	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 10, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_cleanpage  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 11, struct pcie2pata_addr) //_IOW: user addr. 
#define fh_pcie2pata_ioctl_enable_intr	_IO(FH_PCIE2PATA_IOCTL_MAGIC, 12) 
#define fh_pcie2pata_ioctl_disable_intr _IO(FH_PCIE2PATA_IOCTL_MAGIC, 13) 
#define fh_pcie2pata_ioctl_wait_intr	_IO(FH_PCIE2PATA_IOCTL_MAGIC, 14)
#define fh_pcie2pata_ioctl_test_intr  	_IOR(FH_PCIE2PATA_IOCTL_MAGIC, 15, unsigned long) // after waken up, get the current hotplug status
#define fh_pcie2pata_ioctl_dma_print  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 16, struct pcie2pata_print) // after waken up, get the current hotplug status
#define fh_pcie2pata_ioctl_enable_irq   _IO(FH_PCIE2PATA_IOCTL_MAGIC, 17)
#define fh_pcie2pata_ioctl_spinlock_enable_irq   _IO(FH_PCIE2PATA_IOCTL_MAGIC, 18)
#define fh_pcie2pata_ioctl_spinlock_disable_irq   _IO(FH_PCIE2PATA_IOCTL_MAGIC, 19)
#define fh_pcie2pata_ioctl_disable_intr_only   _IO(FH_PCIE2PATA_IOCTL_MAGIC, 20)
#define fh_pcie2pata_ioctl_read_array_ide_reg	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 21, struct pcie2pata_read_array_reg)  
#define fh_pcie2pata_ioctl_write_array_ide_reg  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 22, struct pcie2pata_write_array_reg) //_IOW: user writes. 
#define fh_pcie2pata_ioctl_get_dma_info  	_IOW(FH_PCIE2PATA_IOCTL_MAGIC, 23, struct pcie2pata_addr) //_IOW: user addr. 


/* functions declear */
//static void fhide_exec_command(ide_hwif_t * hwif, unsigned char cmd);
//static unsigned char fhide_read_status(ide_hwif_t * hwif);
static int __init fh_pcie2pata_init(void);
static void __exit fh_pcie2pata_exit(void);



#endif //_FH_PCIE2PATA_H_
