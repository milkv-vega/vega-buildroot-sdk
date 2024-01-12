/************************************************************
  Copyright (C), 2011-2012, FiberHome.
  FileName: 		fh_pcie2pata.c
  Author:			zhenxin.xie    
  Version : 		1.0.0		 
  Date: 			2012-08-13
  Description:	   
  		PCIE to PATA driver. This driver provides a IDE interface and support max two cf cards work together.
					
  History:
  <author>	<time>		<version >		<desc>
  zhenxin.xie  2012-08-13	  1.0.0 	
	  
***********************************************************/
#include <linux/device.h>
#include <linux/module.h>
#include <linux/errno.h>
//#include <linux/pci.h>
#include <linux/blkdev.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/miscdevice.h>
#include <linux/string.h>
#include <linux/delay.h>
/*added by Pengfei*/
#include <asm/io.h>
//#include <asm-generic/io.h>
/*
#include <scsi/scsi_host.h>
#include <linux/libata.h>
#include <linux/ata.h>
#include <linux/ide.h>
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/wait.h>
#include <linux/interrupt.h> // must included this header file for tasklet and irq
*/

/*added by Pengfei*/
/*#include <linux/irq.h> 
#include <linux/irqdomain.h> 
#include <linux/wait.h> 
#include <linux/of.h>
#include <linux/of_net.h>
#include <linux/of_irq.h>
#include <linux/of_device.h>
#include <linux/of_address.h>
#include <linux/mutex.h>
*/
#include <linux/mutex.h>
#include "fh_pcie2pata.h"
struct mutex mutex;

#define PRINT_ERROR		0
#define PRINT_NOTICE	2
#define PRINT_DEBUG		1
#define PRINT_INFO		2
static int print_level = PRINT_ERROR;//PRINT_INFO;
#define fhme_print(n, args...) if (print_level >=(n)) printk(args);

static int driver_is_present = 0;
static int open_counter = 0;

// end by zhenxin.xie

// modified by zhenxin.xie on 2012-12-17: follow the linux source code to define ioremap_return value
static DMA_TypeDef __iomem *fh_ide_ctrl_base1 = NULL;
static void __iomem *dma_reg_base = NULL;

static unsigned int _dma_mem_size = 0;
static unsigned int* _dma_vbase = NULL;
static unsigned int _dma_pbase = 0;
//static unsigned int bus_addr = 0;
//static void* virt_addr = NULL;
//static dma_addr_t dma_write_addr = 0;
//static int _use_himem = 0;

//static wait_queue_head_t _interrupt_wq;
 DECLARE_WAIT_QUEUE_HEAD(_interrupt_wq);
 //static int dma_intr = 0;/**/

//DECLARE_COMPLETION(_interrupt_comp);
//static unsigned int dma_intr_reg = 0;
//static int handle_num = 0;
//static int wake_num = 0;
static LIST_HEAD(_dma_buf);
 static int dmabuf_list_num = 0;
#define DMABUF_LIST_MAX_NUM 10
#define DMA_MAX_SIZE  0x20000
#define DMA_BASE_ADDR 0x40010000
static uint32_t dma_buffer_state;

typedef struct _dma_buffer {
	struct list_head list;
	unsigned long paddr;		 /* DMA phy addr */
	unsigned long vaddr;		 /* DMA virtual addr in kernel space*/
	unsigned long useraddr;	 /* DMA virtual addr in user space*/
	unsigned long size;		 /* buffer size */
} dma_buffer_t;

static LIST_HEAD(_dma_seg);

typedef struct _dma_segment {
    struct list_head list;
    unsigned long req_size;     /* Requested DMA segment size */
    unsigned long blk_size;     /* DMA block size */
    unsigned long blk_order;    /* DMA block size in alternate format */
    unsigned long seg_size;     /* Current DMA segment size */
    unsigned long seg_begin;    /* Logical address of segment */
    unsigned long seg_end;      /* Logical end address of segment */
    unsigned long *blk_ptr;     /* Array of logical DMA block addresses */
    int blk_cnt_max;            /* Maximum number of block to allocate */
    int blk_cnt;                /* Current number of blocks allocated */
} dma_segment_t;

/* Remap virtual DMA addresses to non-cached segment */
//#define REMAP_DMA_NONCACHED

/* DMA memory allocation */
#define ONE_KB 1024
#define ONE_MB (1024*1024)

/* Default DMA memory size */
#define DMA_MEM_DEFAULT (20 * ONE_MB)
#define DMA_MEM_DEFAULT_ROBO (20 * ONE_MB)


/* We try to assemble a contiguous segment from chunks of this size */
#define DMA_BLOCK_SIZE (512 * ONE_KB)

#define MEM_MAP_RESERVE SetPageReserved
#define MEM_MAP_UNRESERVE ClearPageReserved
#define IOREMAP(addr, size) ioremap_nocache(addr, size) //((void *)KSEG1ADDR(addr))
#define VIRT_TO_PAGE(p)     virt_to_page((void*)(p)) //virt_to_page((p))


#define dma_reg_read(addr) \
		(*(volatile unsigned int *)(addr))
		
#define dma_reg_write(addr, value) \
		(*(volatile unsigned int *)(addr) = (value))

#define SOC_BLK_PCIEDMA (0x2000)

static int fh_pcie2pata_open(struct inode *inode, struct file *file)
{
	if(!driver_is_present) {
		fhme_print(PRINT_ERROR, "%s@%s: device is not present\n", __func__, DRIVER_NAME);
		return -EIO;
	}
	return 0;
}

static int fh_pcie2pata_release(struct inode *inode, struct file *file)
{
	return 0;
}

/*
	This function is reserved for further using.
	
*/
static long fh_pcie2pata_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
	int ret = 0;
	struct pcie2pata_read_reg reg_read;
	struct pcie2pata_write_reg reg_write;
	struct pcie2pata_read_array_reg reg_array_read;
	struct pcie2pata_write_array_reg reg_array_write;
	struct pcie2pata_addr dmaaddr;
	struct page *page;
	dma_buffer_t *dma_buffers;
	struct list_head *pos;
	unsigned int i = 0;
	int order;
	void __user *argp = (void __user *)arg;
//	printk("###fh_pcie2pata_ioctl,cmd:0x%x###\n",cmd);

	switch(cmd) {
		case fh_pcie2pata_ioctl_read_reg:
//			printk("enter fh_pcie2pata_ioctl_read_reg\n");
			ret = copy_from_user(&reg_read, (struct pcie2pata_read_reg *)arg, sizeof(struct pcie2pata_read_reg));
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_read_reg: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}

			reg_read.value = dma_reg_read(dma_reg_base + reg_read.addr);
			//fhme_print(PRINT_INFO, "reg_read.addr: 0x%x, reg_read.value: 0x%x\n",reg_read.addr, reg_read.value);
			if(ret < 0) {				
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_read_reg1: pci_read_config_dword failed\n", __func__, DRIVER_NAME);
				return -1;
			}

            #ifdef SOC_ENDIAN_NEED_SWAP
			cpu_to_le32s(&reg_read.value); // zhenxin.xie Note: becasue PCI bus is little endian, but our CPU is big endian, so need ti swap
            #endif
			// if all success, copy it to user layer
			ret = copy_to_user((unsigned long *)arg, &reg_read, sizeof(struct pcie2pata_read_reg));	
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_read_reg1: copy to user failed\n", __func__, DRIVER_NAME);
				return -1;

			}
			ret = 0; // all ok
			break;

		case fh_pcie2pata_ioctl_write_reg:	
//			printk("enter fh_pcie2pata_ioctl_write_reg\n");
			ret = copy_from_user(&reg_write, (struct pcie2pata_write_reg *)arg, sizeof(struct pcie2pata_write_reg));
			//fhme_print(PRINT_NOTICE, "%s: addr:%d value:%d\n", __func__, reg_write.addr, reg_write.value);
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_write_reg: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}

            #ifdef SOC_ENDIAN_NEED_SWAP
            cpu_to_le32s(&reg_write.value);
            #endif
			dma_reg_write(dma_reg_base + reg_write.addr, reg_write.value);
			//fhme_print(PRINT_NOTICE, "after write value(0x%x)\n",*((volatile unsigned int*)(dma_reg_base + reg_write.addr)) );

			// if all success, return 0
			ret = 0; // all ok
			break;
		case fh_pcie2pata_ioctl_read_array_ide_reg:
//			ndelay(1);
			ret = copy_from_user(&reg_array_read, argp, sizeof(struct pcie2pata_read_array_reg));
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_read_ide_reg: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}
			//printk("read copy_from_user OK,addr(0x%x),pbase(0x%x),read_num(%d)\n",reg_array_read.addr,reg_array_read.dma_addr.pbase,reg_array_read.read_num);
			mutex_lock(&mutex);
			fh_ide_ctrl_base1->MSRCADDR = reg_array_read.addr + 0x60000000;
			fh_ide_ctrl_base1->MDSTADDR = reg_array_read.dma_addr.pbase;
			fh_ide_ctrl_base1->MSIZE    = reg_array_read.read_num;
			fh_ide_ctrl_base1->MCTRL    = 0|   //1:start; 0 disable
						               0<<1|   //传输类型2'b00:mem2mem
					  	               0<<6|   //传输模式。2’b00单模式，2’b01：连续模式传输，2’b10：传输重复
					 	              0<<12|   //下一目标地址生成算法。1’b0：增加地址模式，1’b1：固定地址
						              0<<13|   //下一源地址生成算法。1’b0：增加地址模式，1’b1：固定地址
						              3<<16|   //传输到目标的宽度。3’b000：8位。3’b001：16位，3’b010：32位，3’b011：64位，3’b100：128位
						              3<<21|   //从源获取的宽度。3’b000：8位。3’b001：16位，3’b010：32位，3’b011：64位，3’b100：128位
						              0<<24|   //突发中用于将数据传输到目标存储器的传输次数。4’b0000：1次转移~4’b1111：16次传输
						              0<<28;   //突发中用于从源存储器获取数据的传输次数。4’b0000：1次转移~4’b1111：16次传输
			fh_ide_ctrl_base1->CHX_IRQ_EN |= ftrans_irq;
			//printk("%s:%d  src(0x%08x) dst(0x%08x) size(%d)\n",__FUNCTION__,__LINE__,fh_ide_ctrl_base1->MSRCADDR,fh_ide_ctrl_base1->MDSTADDR,fh_ide_ctrl_base1->MSIZE);
			fh_ide_ctrl_base1->MCTRL      |= 1;
			
			i=0;
			while(((fh_ide_ctrl_base1->CHX_IRQ_STAT & 0x1) == 0) && (i < 10000)) //轮询满传输中断完成标志，等待传输结束。
    		{
    			ndelay(1000);
				i++;
    		}
			
			//udelay(10000);
			//printk("%s:%d  src(0x%08x) dst(0x%08x) size(%d)\n",__FUNCTION__,__LINE__,fh_ide_ctrl_base1->MSRCADDR,fh_ide_ctrl_base1->MDSTADDR,fh_ide_ctrl_base1->MSIZE);
			if(i >= 10000)
			{
				mutex_unlock(&mutex);
				printk("DMA read error\n");
				return -1;
			}
			fh_ide_ctrl_base1->CHX_IRQ_CLR|= ftrans_irq;
			//printk("read  OK\n");	
			mutex_unlock(&mutex);

#ifdef SOC_ENDIAN_NEED_SWAP	
			cpu_to_le32s(reg_array_read.dma_addr.vbase); 
#endif	
			// if all success, copy it to user layer
			//ndelay(1); /*for copy_to_user error,18-11-21*/
			ret = copy_to_user(argp, &reg_array_read, sizeof(struct pcie2pata_read_array_reg)); 
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_read_ide_reg1: copy to user failed\n", __func__, DRIVER_NAME);
				//mutex_unlock(&mutex);
				return -1;
			}
			ret = 0; // all ok
			break;

		case fh_pcie2pata_ioctl_write_array_ide_reg:	
//			ndelay(1);
//			spin_lock(&spl_lock);
			
			ret = copy_from_user(&reg_array_write, argp, sizeof(struct pcie2pata_write_array_reg));
			//printk("read copy_from_user OK,addr(0x%x),pbase(0x%x),write_num(%d)\n",reg_array_write.addr,reg_array_write.dma_addr.pbase,reg_array_write.write_num);
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_write_ide_reg: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}
			mutex_lock(&mutex);
			fh_ide_ctrl_base1->MSRCADDR = reg_array_write.dma_addr.pbase;
			fh_ide_ctrl_base1->MDSTADDR = reg_array_write.addr + 0x60000000;
			fh_ide_ctrl_base1->MSIZE    = reg_array_write.write_num;
			fh_ide_ctrl_base1->MCTRL    = 0|   //1:start; 0 disable
						               0<<1|   //传输类型2'b00:mem2mem
					  	               0<<6|   //传输模式。2’b00单模式，2’b01：连续模式传输，2’b10：传输重复
					 	              0<<12|   //下一目标地址生成算法。1’b0：增加地址模式，1’b1：固定地址
						              0<<13|   //下一源地址生成算法。1’b0：增加地址模式，1’b1：固定地址
						              3<<16|   //传输到目标的宽度。3’b000：8位。3’b001：16位，3’b010：32位，3’b011：64位，3’b100：128位
						              3<<21|   //从源获取的宽度。3’b000：8位。3’b001：16位，3’b010：32位，3’b011：64位，3’b100：128位
						              0<<24|   //突发中用于将数据传输到目标存储器的传输次数。4’b0000：1次转移~4’b1111：16次传输
						              0<<28;  //突发中用于从源存储器获取数据的传输次数。4’b0000：1次转移~4’b1111：16次传输
			fh_ide_ctrl_base1->CHX_IRQ_EN |= ftrans_irq;
			//printk("%s:%d  src(0x%08x) dst(0x%08x) size(%d)\n",__FUNCTION__,__LINE__,fh_ide_ctrl_base1->MSRCADDR,fh_ide_ctrl_base1->MDSTADDR,fh_ide_ctrl_base1->MSIZE);
			//printk("%s:%d  fh_ide_ctrl_base1->CHX_IRQ_STAT(0x%08x)=0x%08x\n",__FUNCTION__,__LINE__,&(fh_ide_ctrl_base1->CHX_IRQ_STAT),fh_ide_ctrl_base1->CHX_IRQ_STAT);
			fh_ide_ctrl_base1->MCTRL      |= 1;
			i=0;
			while(((fh_ide_ctrl_base1->CHX_IRQ_STAT & 0x1) == 0) && (i < 10000)) //轮询满传输中断完成标志，等待传输结束。
    		{
    			ndelay(1000);
				i++;
    		}
			//udelay(10000);
			//printk("%s:%d  src(0x%08x) dst(0x%08x) size(%d)\n",__FUNCTION__,__LINE__,fh_ide_ctrl_base1->MSRCADDR,fh_ide_ctrl_base1->MDSTADDR,fh_ide_ctrl_base1->MSIZE);
			if(i >= 10000)
			{
				mutex_unlock(&mutex);
				printk("DMA write error\n");
				return -1;
			}
			//printk("%s:%d  fh_ide_ctrl_base1->CHX_IRQ_STAT(0x%08x)=0x%08x\n",__FUNCTION__,__LINE__,&(fh_ide_ctrl_base1->CHX_IRQ_STAT),fh_ide_ctrl_base1->CHX_IRQ_STAT);
			fh_ide_ctrl_base1->CHX_IRQ_CLR|= ftrans_irq;
			mutex_unlock(&mutex);
			ret = 0; // all ok
			break;
			
		case fh_pcie2pata_ioctl_get_dma:
			//printk("enter fh_pcie2pata_ioctl_get_dma\n");
			ret = copy_from_user(&dmaaddr, (struct pcie2pata_addr *)arg, sizeof(struct pcie2pata_addr));
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_addr: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}
			/*********Request virt_addr(kernel) for Read(DMA write)********/
			if ((dma_buffers = kmalloc(sizeof(dma_buffer_t), GFP_ATOMIC)) == NULL) {
				printk("kmalloc dma_buffers error\n");
				return -1;
			}
			memset(dma_buffers, 0, sizeof(dma_buffer_t));

			mutex_lock(&mutex);
			if(dmabuf_list_num >= DMABUF_LIST_MAX_NUM)
			{
				mutex_unlock(&mutex);
				kfree(dma_buffers);
				printk("There are too many buffers already, please free first!\n");
				return -1;
			}
			for(i=0;i<DMABUF_LIST_MAX_NUM;i++)
			{
				if((dma_buffer_state & (0x1<<i)) == 0)
				{
					//printk("dma_buffer_state:0x%x,0x1<<i:0x%x,dmaaddr.pbase:0x%x\n",dma_buffer_state,0x1<<i,dmaaddr.pbase);
					break;
				}
			}
			if(i < DMABUF_LIST_MAX_NUM)
			{
				dmaaddr.pbase = (i * DMA_MAX_SIZE + DMA_BASE_ADDR);
				dmaaddr.vbase = ioremap(dmaaddr.pbase, dmaaddr.size);
				if(dmaaddr.vbase == 0)
				{
					mutex_unlock(&mutex);
					printk("%s:%d ioremap fail\n",__FUNCTION__,__LINE__);
					kfree(dma_buffers);
					return -1;
				}
				list_add(&dma_buffers->list, &_dma_buf);
				dmabuf_list_num ++;
				dma_buffer_state |= 0x1<<i;
				mutex_unlock(&mutex);
				dma_buffers->paddr = dmaaddr.pbase;
				dma_buffers->vaddr = dmaaddr.vbase;
				dma_buffers->size = dmaaddr.size;

			}
			else
			{
				mutex_unlock(&mutex);
				kfree(dma_buffers);
				printk("dma_buffers is full\n");
				return -1;	
			}
			//printk("alloc kernel vaddr(0x%08x),paddr(0x%08x), size(0x%08x)\n", dmaaddr.vbase, dmaaddr.pbase,dmaaddr.size);	 
			ret = copy_to_user((unsigned long *)arg, &dmaaddr, sizeof(struct pcie2pata_addr)); 
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_addr: copy to user failed\n", __func__, DRIVER_NAME);
				iounmap(dmaaddr.vbase); 
				kfree(dma_buffers);
				mutex_lock(&mutex);
				list_del(&dma_buffers->list);
				dmabuf_list_num --;
				dma_buffer_state &= ~(0x1<<i);
				mutex_unlock(&mutex);
				return -1;
			}
			ret = 0; // all ok

			//printk("dmabuf_list_num(0x%08x), dma_buffer_state = 0x%x\n", dmabuf_list_num,dma_buffer_state);
			break;

		case fh_pcie2pata_ioctl_cleandma:
			
			ret = copy_from_user(&dmaaddr, (struct pcie2pata_addr *)arg, sizeof(struct pcie2pata_addr));
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_addr: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}
			ret = -1;
			mutex_lock(&mutex);
			list_for_each(pos, &_dma_buf) {
				dma_buffers = list_entry(pos, dma_buffer_t, list);
				if (dmaaddr.pbase  == (unsigned int)dma_buffers->paddr) 
				{
					//printk("dma buffer pbase:0x%08x",dma_buffers->paddr);
					iounmap(dma_buffers->vaddr); 
					dma_buffer_state &= ~(0x1<<((dma_buffers->paddr - DMA_BASE_ADDR) / DMA_MAX_SIZE));
					list_del(&dma_buffers->list);
					kfree(dma_buffers);
					dmabuf_list_num --;
					ret = 0; // all ok
					break;
				}
			}
			mutex_unlock(&mutex);
			if(ret != 0)
			{
				printk("Cann't find the buffer\n");
			}
			break;
		case fh_pcie2pata_ioctl_get_info:	
			//printk("%s:%d\n",__func__,__LINE__);
			ret = copy_from_user(&dmaaddr, argp, sizeof(struct pcie2pata_addr));
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_get_info: copy from user failed\n", __func__, DRIVER_NAME);
				return -1;
			}

			unsigned long tmp = (unsigned long)dmaaddr.new_vbase;
			mutex_lock(&mutex);
			list_for_each(pos, &_dma_buf) {
				ret = -1;
				dma_buffers = list_entry(pos, dma_buffer_t, list);

				if (tmp  == (dma_buffers->useraddr)) 
				{
					dmaaddr.pbase = dma_buffers->paddr;
					dmaaddr.size = dma_buffers->size; 
					dmaaddr.vbase = dma_buffers->vaddr;
					ret = 0;
					break;
				}
			}
			mutex_unlock(&mutex);
			//printk("%s:%d\n",__func__,__LINE__);
			if(ret == -1) {
				printk("Can't find dma buffer\n");
				return -1;
			}
			//fhme_print(PRINT_NOTICE, "buffer info: vaddr(0x%08x),paddr(0x%08x),useraddr(0x%lx), size(0x%08x)\n", dmaaddr.vbase, dmaaddr.pbase,dmaaddr.new_vbase,dmaaddr.size);	
			ret = copy_to_user(argp, &dmaaddr, sizeof(struct pcie2pata_addr)); 
			if(ret) {
				fhme_print(PRINT_ERROR, "%s@%s: fh_pcie2pata_ioctl_get_info: copy to user failed\n", __func__, DRIVER_NAME);
				return -1;
			}
			ret = 0; // all ok
			break;

		default:
			//printk("defalt\n");
			break;
	}

//printk("####going to return##\n");
	return ret;
}

static int fh_pcie2pata_mmap(struct file *file, struct vm_area_struct *vma)
{
	int ret = 0;
    unsigned long off = 0 << PAGE_SHIFT;
    unsigned long pos;
	struct list_head *buf_pos;
	dma_buffer_t *dma_buffers;
	unsigned long start = vma->vm_start;
    unsigned long size = vma->vm_end - vma->vm_start;
	mutex_lock(&mutex);
	list_for_each(buf_pos, &_dma_buf) 
	{
		ret = -1;
		dma_buffers = list_entry(buf_pos, dma_buffer_t, list);
		if (vma->vm_pgoff  == ((dma_buffers->paddr) >> PAGE_SHIFT)) 
		{
			//printk("dma buffer pbase:0x%08x",dma_buffers->paddr);
			pos = dma_buffers->paddr + off;
			ret = 0;
			break;
		}
	}
	if(ret == -1) 
	{
		printk("%s:Can't find dma buffer\n", __func__);
		mutex_unlock(&mutex);
		return -1;
	}

    vma->vm_pgoff = pos >> PAGE_SHIFT;
	//printk("vm_start:0x%lx, vm_end:0x%lx size:0x%08x, vm_pgoff:0x%08x\n",start,vma->vm_end,size,vma->vm_pgoff);

    vma->vm_flags |= VM_SHARED | VM_IO | VM_READ | VM_WRITE;
    vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	//printk("vma->vm_start 0x%08x,pos 0x%08x, PAGE_SHIFT=%d\n",vma->vm_start,pos,PAGE_SHIFT);
    if (remap_pfn_range(vma, start, vma->vm_pgoff, size, vma->vm_page_prot))
    {
        fhme_print(PRINT_ERROR, "Enter %s..remap_pfn_range.\n", __func__);
		mutex_unlock(&mutex);
        return (-EAGAIN);
    }
	dma_buffers->useraddr = start;
	mutex_unlock(&mutex);
	//printk("end fh_pcie2pata_mmap\n");

	return 0;

}

static const struct file_operations fh_pcie2pata_fops = 
{
	.owner		= THIS_MODULE,
	.open		= fh_pcie2pata_open,
	.release	= fh_pcie2pata_release,
	.unlocked_ioctl		= fh_pcie2pata_ioctl,   /*added by Pengfei*/ 
	.mmap       = fh_pcie2pata_mmap
};

static struct miscdevice fh_pcie2pata_miscdev = 
{
	FH_PCIE2PATA_MINOR,
	"fh_pcie2pata",
	&fh_pcie2pata_fops
};


static int __init fh_pcie2pata_init(void)
//static int  fh_pcie2pata_init(void)
{
	int ret;
	unsigned long base_addr = 0x60000000;
	unsigned long len = 0x10000000;
	unsigned long tabledma_base_addr = 0x10017000;
	unsigned long tabledma_len = 0x1000;

	
	printk("switch interface: localbus\n");
	
	ret = misc_register(&fh_pcie2pata_miscdev);
	if(ret < 0) {
		fhme_print(PRINT_ERROR, "%s@%s: misc reigister failed, minorID(%d)\n", __func__, DRIVER_NAME, FH_PCIE2PATA_MINOR);
//		platform_driver_unregister(&fbhm_swt_driver);
		return ret;
	}
#if 1	
	fh_ide_ctrl_base1 = ioremap(tabledma_base_addr, tabledma_len);
	if(!fh_ide_ctrl_base1) {
		fhme_print(PRINT_ERROR, "%s@%s: ioremap_nocache failed\n", __func__, DRIVER_NAME);
		return -1;
	}
    dma_reg_base = ioremap(base_addr, len);
	if(!dma_reg_base) {
		fhme_print(PRINT_ERROR, "%s@%s: ioremap failed\n", __func__, DRIVER_NAME);
		return -1;
	}
	
#endif	

	mutex_init(&mutex);

	dma_buffer_state = 0x0;
	driver_is_present = 1; // init success	
	return 0;
}

static void __exit fh_pcie2pata_exit(void)
//static void  fh_pcie2pata_exit(void)
{
	struct list_head *buf_pos;
	dma_buffer_t *dma_buffers;

	//printk("Enter %s\n", __func__);
	misc_deregister(&fh_pcie2pata_miscdev);

	list_for_each(buf_pos, &_dma_buf) {
		dma_buffers = list_entry(buf_pos, dma_buffer_t, list);
		if (dma_buffers->vaddr != NULL) 
		{
			iounmap(dma_buffers->vaddr); 
			list_del(&dma_buffers->list);
			kfree(dma_buffers);
			break;
		}
	}
	dma_buffer_state = 0;

	driver_is_present = 0;
}

//module_platform_driver(fbhm_swt_driver);

module_init(fh_pcie2pata_init);
module_exit(fh_pcie2pata_exit);


MODULE_AUTHOR("Pengfei.Liu@FiberHome");
MODULE_DESCRIPTION("620pcie");
MODULE_LICENSE("GPL");


