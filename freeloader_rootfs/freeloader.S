/*
 * Copyright (C) 2020 Ruigang Wan <rgwan@nucleisys.com>
 * Copyright (C) 2020 Nuclei System Technologies
 */

#define OPENSBI_START_BASE	0x41000000
#define UBOOT_START_BASE	0x41200000
#define KERNEL_START_BASE	0x42000000
#define INITRD_START_BASE	0x48300000
#define FDT_START_BASE		0x48000000

#define COPY_START_BASE		0x48100000

#define CSR_MCACHE_CTL      0x7CA
#define CSR_CACHE_ENABLE    0x10001

.global _start
.section .text
_start:
    	//Disable I/D Cache
    	li t0, CSR_CACHE_ENABLE
    	csrc CSR_MCACHE_CTL, t0

    	//Set exception entry
    	la t0, exc_entry
    	csrw mtvec, t0

    	//config ddr
	li	a5,268537856
	sw	zero,20(a5)
	li	a4,268537856
.L2:
	lw	a5,20(a4)
	andi	a5,a5,2
	beqz	a5,.L2
	li	a5,134258688
	addiw	a5,a5,-765
	sw	a5,512(a4)
	li	a5,270336
	sw	zero,516(a4)
	addiw	a5,a5,-912
	sw	a5,520(a4)
	li	a5,24
	sw	a5,524(a4)
	li	a5,-2147483648
	addiw	a5,a5,84
	sw	a5,528(a4)
	li	a5,520556544
	addiw	a5,a5,-1529
	sw	a5,532(a4)
	li	a5,289738752
	li	a2,8192
	addiw	a5,a5,530
	sw	a5,536(a4)
	addiw	a3,a2,48
	li	a5,28672
	sw	a3,540(a4)
	addiw	a3,a5,-254
	sw	a3,544(a4)
	li	a3,40960
	addiw	a3,a3,-1639
	li	a1,4096
	sw	a3,548(a4)
	addiw	a1,a1,-839
	sw	a1,552(a4)
	li	a1,-1879048192
	sw	zero,556(a4)
	addiw	a1,a1,4
	sw	a1,560(a4)
	li	a1,50528256
	addiw	a1,a1,771
	sw	a1,564(a4)
	sw	a1,568(a4)
	li	a1,262144
	addiw	a1,a1,19
	sw	a1,572(a4)
	li	a1,8
	sw	a1,608(a4)
	li	a1,255
	sw	a1,624(a4)
	addiw	a2,a2,546
	sw	a2,628(a4)
	sw	a3,632(a4)
	li	a3,16384
	addiw	a3,a3,-384
	sw	a3,680(a4)
	li	a3,401408
	addiw	a3,a3,-1408
	sw	a3,684(a4)
	addiw	a5,a5,1911
	sw	a5,816(a4)
	li	a5,5
	sw	a5,824(a4)
	li	a5,1
	sw	a5,516(a4)
	li	a4,268537856
.L3:
	lw	a5,516(a4)
	andi	a5,a5,256
	beqz	a5,.L3

	/*config cpu clock = (25M * 40 / 2) = 500M*/
	/*0x60000060 = 0xb0480a01*/
/*
	li	a5,-1337454592
	li	a4,1610612736
	addiw	a5,a5,-1535
	sw	a5,96(a4)
*/
	
    	/* move _copy_data() to ITCM region */
	li t0, COPY_START_BASE
	la t1, _copy_data
	la t2, _copy_data + 4 * 8
	call _copy_data

    	/* Flush cache */
	fence
	fence.i
	sfence.vma

    	/* Enable I/D Cache */
	li t0, CSR_CACHE_ENABLE
	csrs CSR_MCACHE_CTL, t0

	/* move data from NOR to DDR */
	li t0, OPENSBI_START_BASE
	la t1, sbi
	la t2, _end_sbi

	/* call faraway function */
	li t3, COPY_START_BASE
	//call _copy_data
	jalr ra, t3, 0

	//U-Boot section
	li t0, UBOOT_START_BASE
	la t1, uboot
	la t2, _end_uboot

	//call faraway function
	li t3, COPY_START_BASE
	//call _copy_data
	jalr ra, t3, 0

	// FDT section
	li t0, FDT_START_BASE
	la t1, fdt
	la t2, _end_fdt

	// call faraway function
	li t3, COPY_START_BASE
	//call _copy_data
	jalr ra, t3, 0
/*
	// Kernel section
	li t0, KERNEL_START_BASE
	la t1, kernel
	la t2, _end_kernel

	// call faraway function 
	li t3, COPY_START_BASE
	//call _copy_data
	jalr ra, t3, 0

	// Initrd section 
	li t0, INITRD_START_BASE
	la t1, initrd
	la t2, _end_initrd

	// call faraway function 
	li t3, COPY_START_BASE
	//call _copy_data
	jalr ra, t3, 0
*/
    	/* Flush cache */
	fence
	fence.i
	sfence.vma

    	/* Enable I/D Cache */
    	/*li t0, CSR_CACHE_ENABLE
    	csrs CSR_MCACHE_CTL, t0
	*/
	//disable ilm
	/*csrci 0x7c0, 0x1
	csrci 0x7c1, 0x1*/

	li a0, 0 /* hart ID */
	li a1, 0 /* fdt offset, reserved */
	li a2, 0 /* Reserved */

	/* Goto OpenSBI */

	li t0, OPENSBI_START_BASE
	jr t0

_deadloop:
	j .

.align 6
exc_entry:
	la a0, _start
	csrw mepc, a0
	mret

//copy_data(void *dst, void *src, void *end)
.align 4


_copy_data:
_loop:
	ld t3, 0(t1)
	sd t3, 0(t0)
	addi t0, t0, 8
	addi t1, t1, 8
	blt t1, t2, _loop
	ret


.section .sbipayload
.global sbi
.type sbi, @object
sbi:
.incbin "fw_jump.bin"


.section .ubootpayload
.global uboot
.type uboot, @object
uboot:
.incbin "u-boot.bin"


.section .fdtpayload
/*
.global fdt
.type fdt, @object
fdt:
*/
.incbin "fdt.dtb"

/*
.section .kernelpayload
.global kernel
.type kernel, @object
kernel:
.incbin "kernel.bin"


.section .initrdpayload
.global initrd
.type initrd, @object
initrd:
.incbin "initrd.bin"
*/
