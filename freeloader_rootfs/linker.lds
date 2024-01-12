OUTPUT_ARCH( "riscv" )

ENTRY( _start )

MEMORY
{
	flash (rxai!w) : ORIGIN = 0x20000000, LENGTH = 64M
}


/* Æ«ÒÆµØÖ· */
SECTIONS
{
	.text :
  	{
		KEEP (*(.text))
		. = ALIGN(8);

		KEEP (*(.sbipayload))
		. = ALIGN(8);
		PROVIDE (_end_sbi = .);

		KEEP (*(.ubootpayload))
		. = ALIGN(8);
		PROVIDE (_end_uboot = 0x000DFFFF);

		. = 0x000E0000;
		PROVIDE (fdt = .);
		KEEP (*(.fdtpayload))
		. = ALIGN(8);
		PROVIDE (_end_fdt = 0x000EFFFF);

		. = 0x000FFFFF;
		PROVIDE (_end_env = .);
	} > flash
}

