OUTPUT_ARCH( "riscv" )

ENTRY( _start )

MEMORY
{
	flash (rxai!w) : ORIGIN = 0x20000000, LENGTH = 64M
}


SECTIONS
{

  .text           :
  {
	KEEP (*(.text))

	. = ALIGN(8);
	KEEP (*(.sbipayload))
	. = ALIGN(8);
	PROVIDE (_end_sbi = .);

	KEEP (*(.ubootpayload))
	. = ALIGN(8);
	PROVIDE (_end_uboot = .);

	KEEP (*(.fdtpayload))
	. = ALIGN(8);
	PROVIDE (_end_fdt = .);

	KEEP (*(.kernelpayload))
	. = ALIGN(8);
	PROVIDE (_end_kernel = .);

	KEEP (*(.initrdpayload))
	. = ALIGN(8);
	PROVIDE (_end_initrd = .);

  } >flash


}

