// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright 2000-2009
 * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 */

#include <common.h>
#include <stdlib.h>
#include <command.h>


#define LOCAL_BUS_BASE         		(0x60000000UL)      		/*!< (Local Bus ) Base Address */
#define iVtPortSrm0            		(LOCAL_BUS_BASE+0x6080800)  //0-153 bits 146:146  152:147
#define iVtPortSrm31           		(LOCAL_BUS_BASE+0x6080be0)  //0-153 bits 146:146  152:147
#define inetRegPortSrm0        		(LOCAL_BUS_BASE+0x6101000)  //0-115 bits 4:4
#define inetRegPortSrm31       		(LOCAL_BUS_BASE+0x61011f0)  //0-115 bits 4:4 
#define inetDefVlanCtl         		(LOCAL_BUS_BASE+0x6100020)  //0-162 bits 63:34

#define DMA_AXI_WR_CFG         		(0x1c)
#define DMA_AXI_RD_CFG         		(0x20)
#define INVISIBLE_CFG		   		    (0x40)

#define BITS(start, end)       		((0xFFFFFFFFUL << (start)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(end))))
#define DMA_REG_READ(addr)         	(*(volatile unsigned int *)(addr))
#define DMA_REG_WRITE(addr, value) 	(*(unsigned int *)(addr) = (value))	


extern unsigned char net_port;



/***************************************************
* function	: set_words
* reg	  	：the register to be written
* N		  	：the words number of reg
* start，end：the filed of the reg to be written
* val		：the value to be written in the filed
****************************************************/
static void set_words(volatile uint32_t *reg,uint32_t N,uint32_t start,uint32_t end,uint32_t val)
{
	uint32_t *p_tmp=(uint32_t *) malloc(4*N);

	for(int i=0;i<N;i++)
	{
		*(p_tmp+i) = *(reg+i);
	}

	for(int i=0;i<N;i++)
	{
		if((i==start/32) && (i==end/32))
		{
			*(p_tmp+i) &= ~ BITS(start%32,end%32);
			*(p_tmp+i) |= ((val << start%32) & BITS(start%32,end%32)); 
		}
		*(reg+i)=*(p_tmp+i);
	}
	
	free(p_tmp);
}


static int do_net_config_port(int argc, char * const argv[])
{
	unsigned int port = 0;
	char *endp;
	volatile uint32_t *iVtPortSrm;
	volatile uint32_t *inetRegPortSrm;
	
	port = simple_strtoul(argv[1], &endp, 0);
	net_port = port;
	iVtPortSrm = iVtPortSrm0 + 0x20 * net_port;
	inetRegPortSrm = inetRegPortSrm0 + 0x10 * net_port;

	//printf("net_port: %d\n", net_port); 
	//printf("iVtPortSrm: %x\n", iVtPortSrm); 
	//printf("inetRegPortSrm: %x\n", inetRegPortSrm); 
	
	/*********************配置交换机**********************/
	/*
	set_words((volatile uint32_t *)(LOCAL_BUS_BASE + 0x28), 1, 0, 1, 0);
	set_words((volatile uint32_t *)(LOCAL_BUS_BASE + 0x28), 1, 0, 1, 3);

	//芯片复位后马上配置dma，避免数据进来卡死
	//判断switch_en
	if ((*(volatile uint32_t *)(0x60000000 + INVISIBLE_CFG) & 0x01) != 0x01)
	{	
		printf("error: switch_en is off\n");
		//set_words((volatile uint32_t *)(0x60000000 + INVISIBLE_CFG), 1, 0, 0, 0x01);
	}
	else
	{
		set_words((volatile uint32_t *)(0x67800000 + DMA_AXI_WR_CFG), 1, 0, 7, 0x0F);
		set_words((volatile uint32_t *)(0x67800000 + DMA_AXI_RD_CFG), 1, 0, 7, 0x0F);
	  
		set_words((volatile uint32_t *)iVtPortSrm31,     5, 146, 146, 1);
		set_words((volatile uint32_t *)iVtPortSrm31,     5, 147, 152, net_port);
		set_words((volatile uint32_t *)iVtPortSrm,       5, 146, 146, 1);
		set_words((volatile uint32_t *)iVtPortSrm,       5, 147, 152, 31);
		set_words((volatile uint32_t *)inetRegPortSrm31, 4, 4,   4,   0);
		set_words((volatile uint32_t *)inetRegPortSrm,   4, 4,   4,   0);
		set_words((volatile uint32_t *)inetRegPortSrm31, 4, 2,   2,   0);
		set_words((volatile uint32_t *)inetRegPortSrm,   4, 2,   2,   0);
		set_words((volatile uint32_t *)inetDefVlanCtl,   6, 34,  63,  0);
		printf("Config switch reg\n");
	}
	*/
	
	return 0;
}


static int do_net_config(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
{
	const char *cmd;
	int ret;

	if (argc != 3)
		goto usage;

	cmd = argv[1];
	--argc;
	++argv;

	if (strcmp(cmd, "port") == 0) {
		ret = do_net_config_port(argc, argv);
		goto done;
	}
	else
		return CMD_RET_USAGE;
	
done:
	if (ret != -1)
		return ret;

usage:
	return CMD_RET_USAGE;
}


U_BOOT_CMD(
	netconfig,	3,	1,	do_net_config,
	"config net with given port",
	"netconfig port	<portNum>\n"
);

