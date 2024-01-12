/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (c) 2020 Nuclei System Technology
 *
 * Authors:
 *   Ruigang Wan <rgwan@nucleisys.com>
 */

#ifndef __CONFIG_H
#define __CONFIG_H

#include <linux/sizes.h>

#define CONFIG_SYS_SDRAM_BASE		0x41000000
#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + SZ_2M)

#define CONFIG_SYS_LOAD_ADDR		(CONFIG_SYS_SDRAM_BASE + SZ_2M)

#define CONFIG_SYS_MALLOC_LEN		SZ_8M

#define CONFIG_SYS_BOOTM_LEN		SZ_64M

#define CONFIG_STANDALONE_LOAD_ADDR	0x41200000

//norflash
#define CONFIG_SPI_FLASH_STMICRO 

//ubi

#define CONFIG_CMD_UBI
#define CONFIG_CMD_UBIFS
//#define CONFIG_CMD_MTDPARTS
//#define CONFIG_MTD_DEVICE
//#define CONFIG_MTD_PARTITIONS
//#define CONFIG_RBTREE
#define CONFIG_LZO 
//#define CONFIG_GENERIC_ATOMIC64

/**/

//nandflash
//#define CONFIG_SYS_NAND_SELECT_DEVICE
#define CONFIG_SYS_NAND_SELF_INIT	
#define CONFIG_SYS_NAND_MAX_CHIPS	1
#define CONFIG_SYS_MAX_NAND_DEVICE	1
//#define CONFIG_MTD_CONCAT
#define CONFIG_SYS_NAND_BASE	0
/* Environment options */
/*
#define BOOT_TARGET_DEVICES(func) \
	func(MMC, mmc, 0)
*/
#include <config_distro_bootcmd.h>

#define CONFIG_IPADDR 12.26.0.150
#define CONFIG_SERVERIP 12.26.0.251
#define CONFIG_GATEWAYIP 12.26.0.1
#define CONFIG_NETMASK 255.255.0.0

#define BOOT_TYPE 3		//1: for ramfs + mount jffs2
						//2: ramfs + mount ubifs
						//3: for ubifs boot
#if BOOT_TYPE == 1
#define MTDIDS_DEFAULT "nor0=spi_nor" 
#define MTDPARTS_DEFAULT "mtdparts=spi_nor:896K(uboot),64K(dtb),64K(env),4M(kernel_nor),20M(ramfs_nor),10M(jffs2_nor)"
#elif BOOT_TYPE == 2
#define MTDIDS_DEFAULT "spi-nand0=spi-nand,nor0=spi_nor" 
#define MTDPARTS_DEFAULT "mtdparts=spi_nor:896K(uboot),64K(dtb),64K(env);spi-nand:4M(kernel_nand),20M(ramfs_nand),16M(ubifs_nand)"
#elif BOOT_TYPE == 3
#define MTDIDS_DEFAULT "spi-nand0=spi-nand,nor0=spi_nor" 
#define MTDPARTS_DEFAULT "mtdparts=spi_nor:896K(uboot),64K(dtb),64K(env);spi-nand:4M(kernel_nand),20M(ramfs_nand),40M(ubifs_nand)"
#endif

#define MTD_ACTIVE_PART "spi-nand0,1"

#define CONFIG_EXTRA_ENV_SETTINGS \
	"fdt_high=0xffffffffffffffff\0" \
	"initrd_high=0xffffffffffffffff\0" \
	"mtdparts=" MTDPARTS_DEFAULT "\0" \
	"kernel_addr_r=0x42000000\0" \
	   "fdt_addr_r=0x48000000\0" \
	   "scriptaddr=0x48100000\0" \
   "pxefile_addr_r=0x48200000\0" \
   "ramdisk_addr_r=0x48300000\0" \
  "freeloader_size=0x00100000\0" \
         "dtb_size=0x00010000\0" \
	  "kernel_size=0x00400000\0" \
	   "ramfs_size=0x01400000\0" \
	   "jffs2_size=0x00A00000\0" \
	"bootcmd=run bootcmd_ubifs_boot\0" \
	"freeloader_file=freeloader.bin\0" \
	"dtb_file=fdt.dtb \0" \
	"os_file=kernel.bin \0" \
	"ramfs_file=initrd.bin \0" \
	"jffs2_file=jffs2.img \0" \
	"ubifs_file=ubifs.img \0" \
	"bootcmd_nor=sf probe 1;sf read ${kernel_addr_r} kernel_nor ${kernel_size};sf read ${ramdisk_addr_r} ramfs_nor ${ramfs_size};bootm ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}\0" \
	"bootcmd_nand=sf probe 1;nand read ${kernel_addr_r} kernel_nand ${kernel_size};nand read ${ramdisk_addr_r} ramfs_nand ${ramfs_size};bootm ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}\0" \
	"bootcmd_ubifs_boot=setenv bootargs ubi.mtd=6 root=ubi0:ubifs rw rootfstype=ubifs init=/linuxrc mem=256M console=ttySIF0,115200 user_debug=1;" \
	"sf probe 1;nand read ${kernel_addr_r} kernel_nand ${kernel_size};bootm ${kernel_addr_r} - ${fdt_addr_r}\0"\
	"bootcmd_nfs=setenv bootargs root=/dev/nfs nfsroot=${serverip}:/home/nfs/buildrootfs/ ip=${ipaddr}:${serverip}:${gatewayip}:${netmask} init=/linuxrc console=ttySIF0,115200;" \
	"sf probe 1;nand read ${kernel_addr_r} kernel_nand ${kernel_size};bootm ${kernel_addr_r} - ${fdt_addr_r}\0"\
	"bootcmd_entire=bootm ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}\0" \
	"updatefreeloader=tftpboot ${kernel_addr_r} $freeloader_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;sf erase 0x0 ${freeloader_size};sf write ${kernel_addr_r} 0x0 ${freeloader_size};fi\0" \
	"updatedtb=tftpboot ${fdt_addr_r} $dtb_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;sf erase dtb ${dtb_size};sf write ${fdt_addr_r} dtb ${dtb_size};fi\0" \
	"updateos_nor=tftpboot ${kernel_addr_r} $os_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;sf erase kernel_nor ${kernel_size};sf write ${kernel_addr_r} kernel_nor ${kernel_size};fi\0" \
	"updateos_nand=tftpboot ${kernel_addr_r} $os_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;nand erase.part kernel_nand;nand write ${kernel_addr_r} kernel_nand ${kernel_size};fi\0" \
	"updateramfs_nor=tftpboot ${ramdisk_addr_r} $ramfs_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;sf erase ramfs_nor ${ramfs_size};sf write ${ramdisk_addr_r} ramfs_nor ${ramfs_size};fi\0" \
	"updateramfs_nand=tftpboot ${ramdisk_addr_r} $ramfs_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;nand erase.part ramfs_nand;nand write ${ramdisk_addr_r} ramfs_nand ${ramfs_size};fi\0" \
	"updatejffs2_nor=tftpboot ${ramdisk_addr_r} $jffs2_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;sf erase jffs2_nor ${jffs2_size};sf write ${ramdisk_addr_r} jffs2_nor ${jffs2_size};fi\0" \
	"updateubifs_nand=tftpboot ${ramdisk_addr_r} $ubifs_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;nand erase.part ubifs_nand;ubi part ubifs_nand;ubi create ubifs;ubi write ${ramdisk_addr_r} ubifs 0x00A00000;fi\0" \
	"updateubifs_boot=tftpboot ${ramdisk_addr_r} $ubifs_file;if test \"$?\" = \"1\"; then echo \"tftp fail\";" \
	"else echo \"tftp ok\";sf probe 1;nand erase.part ubifs_nand;ubi part ubifs_nand;ubi create ubifs;ubi write ${ramdisk_addr_r} ubifs 0x01900000;fi\0" \
	BOOTENV

#define CONFIG_PREBOOT \
	"setenv fdt_addr ${fdtcontroladdr};" \
	"fdt addr ${fdtcontroladdr};"

#endif /* __CONFIG_H */
