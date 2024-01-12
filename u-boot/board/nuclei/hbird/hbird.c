// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright (c) 2019 Nuclei System Technologies
 *
 * Authors:
 *   Ruigang Wan <rgwan@nucleisys.com>
 */

#include <common.h>
#include <dm.h>
#include <linux/delay.h>
#include <linux/io.h>


int board_init(void)
{
	/* Set Pinmux to enable QSPI2 for SD boot */
	/*
	writel (0x01, (void *)0x10016000);
	writel (0xec000000, (void *)0x10011008);
	writel (0x10000000, (void *)0x10011004);
	writel (0xfc030000, (void *)0x10011038);
	writel (0x00, (void *)0x10016000); //NUSPI Prescaler = 4
	*/
	__asm__ __volatile__ ("fence w,o" : : : "memory");

	printf ("Board: Initialized\n");
	return 0;
}

extern int fh_net_initialize(bd_t *bis);
int board_eth_init(bd_t *bis)
{
	return fh_net_initialize(bis);
}


extern int device_probe(struct udevice *dev);

//int board_nand_init(struct nand_chip *nand)
int board_nand_init(void)
{	
	struct udevice *dev; 
	//struct mtd_info *mtd; 

	//printf ("Board: board_nand_init\n");

	uclass_get_device(UCLASS_MTD, 0, &dev); 
	device_probe(dev);	

	//dev_get_uclass_priv(dev); 
	//nand_register(0, mtd);
	//spi_flash_probe(1, 1,5000000, 3);
	return 0;
}
/**/
