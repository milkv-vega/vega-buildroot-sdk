cmd_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o := /home/dev/lpf/gcc/bin/riscv-nuclei-linux-gnu-gcc -Wp,-MMD,/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/.epon_olt_mac.mod.o.d  -nostdinc -isystem /home/dev/lpf/gcc/bin/../lib/gcc/riscv-nuclei-linux-gnu/9.2.0/include -I/home/dev/Nuclei/linux_sdk/linux/arch/riscv/include -I./arch/riscv/include/generated -I/home/dev/Nuclei/linux_sdk/linux/include -I./include -I/home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/home/dev/Nuclei/linux_sdk/linux/include/uapi -I./include/generated/uapi -include /home/dev/Nuclei/linux_sdk/linux/include/linux/kconfig.h -include /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_types.h -D__KERNEL__ -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -mabi=lp64 -march=rv64imac -mno-save-restore -DCONFIG_PAGE_OFFSET=0xffffffe000000000 -mcmodel=medany -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=/home/dev/Nuclei/linux_sdk/linux/= -Wno-packed-not-aligned  -DMODULE -mno-relax  -DKBUILD_BASENAME='"epon_olt_mac.mod"' -DKBUILD_MODNAME='"epon_olt_mac"' -c -o /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.c

source_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o := /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.c

deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o := \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/retpoline.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kconfig.h \
    $(wildcard include/config/cc/version/text.h) \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_attributes.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/types.h \
  arch/riscv/include/generated/uapi/asm/types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/int-ll64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/int-ll64.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/bitsperlong.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitsperlong.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/posix_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stddef.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/stddef.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_types.h \
  arch/riscv/include/generated/uapi/asm/posix_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/posix_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/const.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/const.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/const.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/limits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/limits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/limits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/linkage.h \
    $(wildcard include/config/arch/use/sym/annotations.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stringify.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/linkage.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  arch/riscv/include/generated/asm/rwonce.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/rwonce.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/kasan.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/kcsan.h) \
    $(wildcard include/config/kcsan/ignore/atomics.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bitops.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/bits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/build_bug.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/bitops.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/typecheck.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/irqflags.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/processor.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/processor.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/vdso/processor.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/ptrace.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/ptrace.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/csr.h \
    $(wildcard include/config/riscv/m/mode.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/asm.h \
  arch/riscv/include/generated/asm/percpu.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/percpu.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/barrier.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/barrier.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/__ffs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/ffz.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/fls.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/__fls.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/fls64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/sched.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/ffs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/hweight.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/arch_hweight.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/const_hweight.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/non-atomic.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/le.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/byteorder.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/byteorder/little_endian.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/swab.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/swab.h \
  arch/riscv/include/generated/uapi/asm/swab.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/swab.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/byteorder/generic.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bitops/ext2-atomic.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/dynamic/debug/core.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kern_levels.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/kernel.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/sysinfo.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/cache.h \
  arch/riscv/include/generated/asm/div64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/div64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stat.h \
  arch/riscv/include/generated/uapi/asm/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
    $(wildcard include/config/posix/timers.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preemption.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/riscv/include/generated/asm/preempt.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/preempt.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/instrumentation.h \
    $(wildcard include/config/debug/entry.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/restart_block.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/math64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/time.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/time_types.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/current.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/thread_info.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/page.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/flatmem.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pfn.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/getorder.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bottom_half.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/raw/lock/nesting.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/preempt/lock.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/mmiowb.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/errno.h \
  arch/riscv/include/generated/uapi/asm/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/errno-base.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bitmap.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/string.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/string.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/atomic.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/cmpxchg.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/fence.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/atomic-fallback.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/atomic-long.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/smp_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock_types_up.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rwlock_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock_up.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock_api_up.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timex.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/timex.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/param.h \
  arch/riscv/include/generated/uapi/asm/param.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/param.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/timex.h \
    $(wildcard include/config/riscv/sbi.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/mmio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/highuid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kmod.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/umh.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/gfp.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shadow/call/stack.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/wait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/wait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
    $(wildcard include/config/numa/keep/meminfo.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/nodemask.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page-flags-layout.h \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/kasan/sw/tags.h) \
  include/generated/bounds.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rbtree.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu/generic.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tasks/rcu/trace.h) \
    $(wildcard include/config/tasks/rude/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcutiny.h \
    $(wildcard include/config/srcu.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/err.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/completion.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/swait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ktime.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/jiffies.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/ktime.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timekeeping.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timekeeping32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/mmu.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/notifier.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/osq_lock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcu_segcblist.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/srcutiny.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  arch/riscv/include/generated/asm/topology.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/topology.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/sysctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/elf.h \
    $(wildcard include/config/arch/use/gnu/property.h) \
    $(wildcard include/config/arch/have/elf/prot.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/elf.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/elf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/elf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/elf-em.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sysfs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/idr.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/radix-tree.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kconfig.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/local_lock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/local_lock_internal.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kobject_ns.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kref.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/refcount.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rbtree_latch.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/error-injection.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/error-injection.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/tracepoint-defs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/static_key.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/module.h \
    $(wildcard include/config/module/sections.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/build-salt.h \
    $(wildcard include/config/build/salt.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/elfnote.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vermagic.h \
  include/generated/utsrelease.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/vermagic.h \

/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o: $(deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o)

$(deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.mod.o):
