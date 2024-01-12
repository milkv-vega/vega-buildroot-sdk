/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (C) 2008 David Gibson, IBM Corporation
 * Copyright (C) 2012 Regents of the University of California
 * Copyright (C) 2020 Nuclei System Technologies
 * Copyright (C) 2020 Ruigang Wan <rgwan@nucleisys.com>
 */

#include <common.h>
#include <serial.h>
#include <errno.h>
#include <dm.h>
#include <fdtdec.h>

#include <asm/sbi.h>


#ifdef CONFIG_DEBUG_UART_RISCV_SBI

#include <debug_uart.h>


static inline void _debug_uart_init(void)
{
	//Nothing
}

static inline void _debug_uart_putc(int ch)
{
	sbi_console_putchar(ch);
}

DEBUG_UART_FUNCS

#endif

static int sbi_tty_pending_char = -1;

static int sbi_tty_put(struct udevice *dev, const char ch)
{

	sbi_console_putchar(ch);

	return 0;
}

static int sbi_tty_get(struct udevice *dev)
{
	int c;
	if (sbi_tty_pending_char != -1)
	{
		c = sbi_tty_pending_char;
		sbi_tty_pending_char = -1;
	}
	else
	{
		c = sbi_console_getchar();
		if (c < 0)
			return -EAGAIN;
	}

	return c;
}

static int sbi_tty_setbrg(struct udevice *dev, int baudrate)
{
	return 0;
}

static int sbi_tty_pending(struct udevice *dev, bool input)
{
	int c;
	if (input)
	{
		if (sbi_tty_pending_char != -1)
			return 1;

		c = sbi_console_getchar();
		if(c < 0)
			return 0;
		sbi_tty_pending_char = c;
		return 1;
	}
	return 0;
}

static const struct udevice_id serial_riscv_sbi_ids[] = {
	{ .compatible = "sbi,console" },
	{ }
};

const struct dm_serial_ops serial_riscv_sbi_ops = {
	.putc = sbi_tty_put,
	.pending = sbi_tty_pending,
	.getc = sbi_tty_get,
	.setbrg = sbi_tty_setbrg,
};

U_BOOT_DRIVER(serial_riscv_sbi) = {
	.name	= "serial_riscv_sbi",
	.id	= UCLASS_SERIAL,
	.of_match = serial_riscv_sbi_ids,
	.ops	= &serial_riscv_sbi_ops,
	.flags	= DM_FLAG_PRE_RELOC,
};
