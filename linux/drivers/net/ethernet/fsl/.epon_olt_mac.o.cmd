cmd_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o := /home/dev/lpf/gcc/bin/riscv-nuclei-linux-gnu-gcc -Wp,-MMD,/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/.epon_olt_mac.o.d  -nostdinc -isystem /home/dev/lpf/gcc/bin/../lib/gcc/riscv-nuclei-linux-gnu/9.2.0/include -I/home/dev/Nuclei/linux_sdk/linux/arch/riscv/include -I./arch/riscv/include/generated -I/home/dev/Nuclei/linux_sdk/linux/include -I./include -I/home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/home/dev/Nuclei/linux_sdk/linux/include/uapi -I./include/generated/uapi -include /home/dev/Nuclei/linux_sdk/linux/include/linux/kconfig.h -include /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_types.h -D__KERNEL__ -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -mabi=lp64 -march=rv64imac -mno-save-restore -DCONFIG_PAGE_OFFSET=0xffffffe000000000 -mcmodel=medany -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=/home/dev/Nuclei/linux_sdk/linux/= -Wno-packed-not-aligned  -DMODULE -mno-relax  -DKBUILD_BASENAME='"epon_olt_mac"' -DKBUILD_MODNAME='"epon_olt_mac"' -c -o /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.c

source_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o := /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.c

deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o := \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/of.h) \
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
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/srcu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/energy/model.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/declare/coherent.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/arch/has/sync/dma/for/device.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu/all.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dev_printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/dynamic/debug/core.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compiler_types.h \
  arch/riscv/include/generated/asm/rwonce.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/rwonce.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/kasan.h) \
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
  arch/riscv/include/generated/uapi/asm/posix_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/posix_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/kcsan.h) \
    $(wildcard include/config/kcsan/ignore/atomics.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ratelimit.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/param.h \
  arch/riscv/include/generated/uapi/asm/param.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/param.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched.h \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tasks/trace/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/x86/mce.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/preemption.h) \
    $(wildcard include/config/debug/rseq.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/sched.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/current.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/const.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/const.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/const.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/asm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/instrumentation.h \
    $(wildcard include/config/debug/entry.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
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
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/linkage.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bitops.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/bits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/build_bug.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/bitops.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqflags.h \
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
  arch/riscv/include/generated/asm/percpu.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/percpu.h \
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
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu/generic.h) \
    $(wildcard include/config/tasks/rcu/trace.h) \
    $(wildcard include/config/tasks/rude/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/atomic.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/cmpxchg.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/fence.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/atomic-fallback.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/atomic-long.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
  arch/riscv/include/generated/asm/preempt.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/preempt.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/thread_info.h \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/restart_block.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/math64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/time.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/time_types.h \
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
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/raw/lock/nesting.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/preempt/lock.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bitmap.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/string.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/string.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcutiny.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/wait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/mmiowb.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/errno.h \
  arch/riscv/include/generated/uapi/asm/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/errno.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/errno-base.h \
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
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/wait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/refcount.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sem.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/sem.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ipc.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/highuid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rhashtable-types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/osq_lock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ktime.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
    $(wildcard include/config/posix/timers.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/seqlock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/time32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timex.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/timex.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/timex.h \
    $(wildcard include/config/riscv/sbi.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/mmio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/time.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/jiffies.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /home/dev/Nuclei/linux_sdk/linux/include/vdso/ktime.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timekeeping.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timekeeping32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/ipc.h \
  arch/riscv/include/generated/uapi/asm/ipcbuf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/ipcbuf.h \
  arch/riscv/include/generated/uapi/asm/sembuf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/sembuf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/shm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/shm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/hugetlb_encode.h \
  arch/riscv/include/generated/uapi/asm/shmbuf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/shmbuf.h \
  arch/riscv/include/generated/asm/shmparam.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/shmparam.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kcov.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/kcov.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hrtimer_defs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rbtree.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/timerqueue.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/seccomp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
    $(wildcard include/config/numa/keep/meminfo.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/resource.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/resource.h \
  arch/riscv/include/generated/uapi/asm/resource.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/resource.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/resource.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/latencytop.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/prio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/signal.h \
  arch/riscv/include/generated/uapi/asm/signal.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/signal.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/signal.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/signal-defs.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/sigcontext.h \
  arch/riscv/include/generated/uapi/asm/siginfo.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/siginfo.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/posix-timers.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/alarmtimer.h \
    $(wildcard include/config/rtc/class.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/rseq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kcsan.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/energy_model.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sysfs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/err.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/idr.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/radix-tree.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shadow/call/stack.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memory/hotplug.h) \
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
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page-flags-layout.h \
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
  /home/dev/Nuclei/linux_sdk/linux/include/linux/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/auxvec.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/completion.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/swait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uprobes.h \
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
    $(wildcard include/config/tree/srcu.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcu_segcblist.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/srcutiny.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  arch/riscv/include/generated/asm/topology.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/topology.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kconfig.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/local_lock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/local_lock_internal.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kobject_ns.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stat.h \
  arch/riscv/include/generated/uapi/asm/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kref.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/cpufreq.h \
    $(wildcard include/config/cpu/freq.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/topology.h \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/debug.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/idle.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ioport.h \
    $(wildcard include/config/io/strict/devmem.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/klist.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/overflow.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/device/bus.h \
    $(wildcard include/config/acpi.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/device/class.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/device/driver.h \
  arch/riscv/include/generated/asm/device.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/device.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pm_wakeup.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/module.h \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kmod.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/umh.h \
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
  /home/dev/Nuclei/linux_sdk/linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
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
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/arch/has/pkeys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/sparc64.h) \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/dev/pagemap/ops.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/pci/p2pdma.h) \
    $(wildcard include/config/arch/has/pte/special.h) \
    $(wildcard include/config/arch/has/pte/devmap.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/init/on/alloc/default/on.h) \
    $(wildcard include/config/init/on/free/default/on.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/arch/has/set/direct/map.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
    $(wildcard include/config/mapping/dirty/helpers.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mmap_lock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/range.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu-refcount.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bit_spinlock.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/shrinker.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page_ext.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/arch/stackwalk.h) \
    $(wildcard include/config/have/reliable/stacktrace.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stackdepot.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/memremap.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sizes.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pgtable.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/highpte.h) \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/pgtable.h \
    $(wildcard include/config/va/bits.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/pgtable-bits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/pgtable-nopud.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/pgtable-nop4d.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/tlbflush.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/smp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqreturn.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/pgtable-64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/pgtable_uffd.h \
    $(wildcard include/config/have/arch/userfaultfd/wp.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/huge_mm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/fs.h \
    $(wildcard include/config/read/only/thp/for/fs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/fs/verity.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
    $(wildcard include/config/io/uring.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/wait_bit.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kdev_t.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/kdev_t.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dcache.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rculist_bl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/list_bl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/path.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/capability.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/capability.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/semaphore.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/fcntl.h \
    $(wildcard include/config/arch/32bit/off/t.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/fcntl.h \
  arch/riscv/include/generated/uapi/asm/fcntl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/fcntl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/openat2.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/migrate_mode.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu-rwsem.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcuwait.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/signal.h \
    $(wildcard include/config/proc/fs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/jobctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/task.h \
    $(wildcard include/config/have/copy/thread/tls.h) \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
    $(wildcard include/config/have/arch/thread/struct/whitelist.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uaccess.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/instrumented.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/uaccess.h \
  arch/riscv/include/generated/asm/extable.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/extable.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/key.h \
    $(wildcard include/config/key/notifications.h) \
    $(wildcard include/config/net.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/rcu_sync.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/delayed_call.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uuid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/uuid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/errseq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ioprio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/rt.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/iocontext.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/fs_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/fs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/ioctl.h \
  arch/riscv/include/generated/uapi/asm/ioctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/ioctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/ioctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/percpu_counter.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/dqblk_xfs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dqblk_v1.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dqblk_v2.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dqblk_qtree.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/projid.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/quota.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/nfs_fs_i.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/miscdevice.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/major.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqnr.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/irqnr.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hardirq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ftrace_irq.h \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  arch/riscv/include/generated/asm/hardirq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/hardirq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irq_cpustat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irq.h \
    $(wildcard include/config/generic/irq/effective/aff/mask.h) \
    $(wildcard include/config/generic/irq/ipi.h) \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/generic/irq/migration.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
    $(wildcard include/config/generic/irq/multi/handler.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqhandler.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/io.h \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/pci.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/io.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/generic/ioremap.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/logic_pio.h \
    $(wildcard include/config/indirect/pio.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/fwnode.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vmalloc.h \
    $(wildcard include/config/kasan/vmalloc.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/vmalloc.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kasan.h \
    $(wildcard include/config/kasan/generic.h) \
    $(wildcard include/config/kasan/inline.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/irq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/irq.h \
  arch/riscv/include/generated/asm/irq_regs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/irq_regs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/generic/irq/debugfs.h) \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/handle/domain/irq.h) \
    $(wildcard include/config/irq/domain.h) \
  arch/riscv/include/generated/asm/hw_irq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/hw_irq.h \
  arch/riscv/include/generated/asm/sections.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/sections.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/hyperv/net.h) \
    $(wildcard include/config/wlan.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/rps.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/xps.h) \
    $(wildcard include/config/xdp/sockets.h) \
    $(wildcard include/config/bql.h) \
    $(wildcard include/config/rfs/accel.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/xfrm/offload.h) \
    $(wildcard include/config/libfcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/l3/master/dev.h) \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/tls/device.h) \
    $(wildcard include/config/vlan/8021q.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/tipc.h) \
    $(wildcard include/config/irda.h) \
    $(wildcard include/config/atalk.h) \
    $(wildcard include/config/decnet.h) \
    $(wildcard include/config/mpls/routing.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/netfilter/ingress.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/garp.h) \
    $(wildcard include/config/mrp.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/macsec.h) \
    $(wildcard include/config/net/flow/limit.h) \
    $(wildcard include/config/ethtool/netlink.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/delay.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/delay.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/prefetch.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dynamic_queue_limits.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ethtool.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/compat.h \
    $(wildcard include/config/arch/has/syscall/wrapper.h) \
    $(wildcard include/config/x86/x32/abi.h) \
    $(wildcard include/config/compat/old/sigaction.h) \
    $(wildcard include/config/odd/rt/sigaction.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/socket.h \
  arch/riscv/include/generated/uapi/asm/socket.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/socket.h \
  arch/riscv/include/generated/uapi/asm/sockios.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/sockios.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/sockios.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/uio.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
    $(wildcard include/config/arch/has/uaccess/mcsafe.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/crypto/hash.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/crypto.h \
    $(wildcard include/config/crypto/stats.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/uio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/socket.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/if.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/libc-compat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/hdlc/ioctl.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/aio_abi.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/unistd.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/unistd.h \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/uapi/asm/unistd.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/asm-generic/unistd.h \
  arch/riscv/include/generated/asm/compat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/compat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/ethtool.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/if_ether.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/net/tc/skb/ext.h) \
    $(wildcard include/config/skb/extensions.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/switchdev.h) \
    $(wildcard include/config/net/redirect.h) \
    $(wildcard include/config/net/rx/busy/poll.h) \
    $(wildcard include/config/network/secmark.h) \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
    $(wildcard include/config/network/phy/timestamping.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/mptcp.h) \
    $(wildcard include/config/netfilter/xt/target/trace.h) \
    $(wildcard include/config/nf/tables.h) \
    $(wildcard include/config/ip/vs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bvec.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/net.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/random.h \
    $(wildcard include/config/arch/random.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/once.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/random.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/net.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/textsearch.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/checksum.h \
  arch/riscv/include/generated/asm/checksum.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/checksum.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dma-mapping.h \
    $(wildcard include/config/swiotlb.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/setup/dma/ops.h) \
    $(wildcard include/config/arch/has/teardown/dma/ops.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dma-debug.h \
    $(wildcard include/config/dma/api/debug.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/dma-direction.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/sgl/alloc.h) \
    $(wildcard include/config/arch/no/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
  arch/riscv/include/generated/asm/dma-mapping.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/dma-mapping.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/netdev_features.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/sched/clock.h \
    $(wildcard include/config/have/unstable/sched/clock.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/flow_dissector.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/in6.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/in6.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/siphash.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/if_ether.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/splice.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pipe_fs_i.h \
    $(wildcard include/config/watch/queue.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/if_packet.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/flow.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/net_namespace.h \
    $(wildcard include/config/ieee802154/6lowpan.h) \
    $(wildcard include/config/ip/sctp.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/nf/defrag/ipv6.h) \
    $(wildcard include/config/netfilter/netlink/acct.h) \
    $(wildcard include/config/nf/ct/netlink/timeout.h) \
    $(wildcard include/config/wext/core.h) \
    $(wildcard include/config/mpls.h) \
    $(wildcard include/config/can.h) \
    $(wildcard include/config/crypto/user.h) \
    $(wildcard include/config/net/ns.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/core.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
    $(wildcard include/config/tls.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/snmp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/snmp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/u64_stats_sync.h \
  arch/riscv/include/generated/asm/local64.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/local64.h \
  arch/riscv/include/generated/asm/local.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/local.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/unix.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/packet.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/route/classid.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/mroute/multiple/tables.h) \
    $(wildcard include/config/ip/route/multipath.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/inet_frag.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/subtrees.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mroute/multiple/tables.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/dst_ops.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/icmpv6.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/nexthop.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/ieee802154_6lowpan.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/sctp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/dccp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/netfilter.h \
    $(wildcard include/config/netfilter/family/arp.h) \
    $(wildcard include/config/netfilter/family/bridge.h) \
    $(wildcard include/config/nf/defrag/ipv4.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/netfilter_defs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/netfilter.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/in.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/in.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/nftables.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/xfrm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/xfrm.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/mpls.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/can.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/xdp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netns/bpf.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bpf-netns.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/bpf.h \
    $(wildcard include/config/efficient/unaligned/access.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/bpf/kprobe/override.h) \
    $(wildcard include/config/bpf/lirc/mode2.h) \
    $(wildcard include/config/sock/cgroup/data.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/bpf_common.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/ns_common.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/seq_file_net.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/seq_file.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/netprio_cgroup.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cgroup.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/cgroup/data.h) \
    $(wildcard include/config/cgroup/bpf.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/cgroupstats.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/taskstats.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/nsproxy.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/user_namespace.h \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/persistent/keyrings.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kernel_stat.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cgroup-defs.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bpf-cgroup.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bpf.h \
    $(wildcard include/config/bpf/jit.h) \
    $(wildcard include/config/bpf/stream/parser.h) \
    $(wildcard include/config/inet.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/file.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kallsyms.h \
    $(wildcard include/config/kallsyms/all.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/psi_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/kthread.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/xdp.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/neighbour.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/netlink.h \
  /home/dev/Nuclei/linux_sdk/linux/include/net/scm.h \
    $(wildcard include/config/security/network.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/security.h \
    $(wildcard include/config/security/infiniband.h) \
    $(wildcard include/config/security/network/xfrm.h) \
    $(wildcard include/config/security/path.h) \
    $(wildcard include/config/securityfs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/netlink.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/netdevice.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/if_link.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/if_link.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/if_bonding.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/pkt_cls.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/pkt_sched.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hashtable.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/etherdevice.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/crc32.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bitrev.h \
    $(wildcard include/config/have/arch/bitreverse.h) \
  arch/riscv/include/generated/asm/unaligned.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/unaligned.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/unaligned/le_struct.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/unaligned/packed_struct.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/unaligned/be_byteshift.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/unaligned/generic.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of.h \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mod_devicetable.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/property.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_net.h \
    $(wildcard include/config/of/net.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/phy.h \
    $(wildcard include/config/led/trigger/phy.h) \
    $(wildcard include/config/phylib.h) \
    $(wildcard include/config/mdio/device.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/linkmode.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mdio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/mdio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mii.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/mii.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mii_timestamper.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/iopoll.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_irq.h \
    $(wildcard include/config/ppc32.h) \
    $(wildcard include/config/ppc/pmac.h) \
    $(wildcard include/config/of/irq.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqdomain.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_device.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cpu.h \
    $(wildcard include/config/pm/sleep/smp.h) \
    $(wildcard include/config/pm/sleep/smp/nonzero/cpu.h) \
    $(wildcard include/config/hotplug/smt.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/node.h \
    $(wildcard include/config/hmem/reporting.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/cpuhotplug.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
    $(wildcard include/config/superh.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_platform.h \
    $(wildcard include/config/of/address.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_address.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/regulator/consumer.h \
    $(wildcard include/config/regulator.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/suspend.h \
    $(wildcard include/config/vt.h) \
    $(wildcard include/config/hibernation/snapshot/dev.h) \
    $(wildcard include/config/pm/sleep/debug.h) \
    $(wildcard include/config/pm/autosleep.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/swap.h \
    $(wildcard include/config/frontswap.h) \
    $(wildcard include/config/memcg/swap.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/memcontrol.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/page_counter.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/vmpressure.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/eventfd.h \
    $(wildcard include/config/eventfd.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/writeback.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/flex_proportions.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/backing-dev-defs.h \
    $(wildcard include/config/debug/fs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/blk_types.h \
    $(wildcard include/config/blk/cgroup/iocost.h) \
    $(wildcard include/config/blk/inline/encryption.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/blk-cgroup.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/blkdev.h \
    $(wildcard include/config/blk/rq/alloc/time.h) \
    $(wildcard include/config/blk/wbt.h) \
    $(wildcard include/config/blk/dev/zoned.h) \
    $(wildcard include/config/blk/dev/bsg.h) \
    $(wildcard include/config/blk/dev/throttling.h) \
    $(wildcard include/config/blk/debug/fs.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/genhd.h \
    $(wildcard include/config/fail/make/request.h) \
    $(wildcard include/config/cdrom.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pagemap.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/highmem.h \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/debug/highmem.h) \
  /home/dev/Nuclei/linux_sdk/linux/arch/riscv/include/asm/cacheflush.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/cacheflush.h \
  arch/riscv/include/generated/asm/kmap_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/asm-generic/kmap_types.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/hugetlb_inline.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/mempool.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bio.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/bsg.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/bsg.h \
  /home/dev/Nuclei/linux_sdk/linux/include/uapi/linux/blkzoned.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/elevator.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/freezer.h \
    $(wildcard include/config/cgroup/freezer.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/gpio.h \
    $(wildcard include/config/gpiolib.h) \
    $(wildcard include/config/arch/have/custom/gpio/h.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/of_gpio.h \
    $(wildcard include/config/of/gpio.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/gpio/driver.h \
    $(wildcard include/config/gpio/generic.h) \
    $(wildcard include/config/gpiolib/irqchip.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/irqchip/chained_irq.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pinctrl/pinctrl.h \
    $(wildcard include/config/generic/pinconf.h) \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pinctrl/pinctrl-state.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pinctrl/devinfo.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pinctrl/pinconf-generic.h \
  /home/dev/Nuclei/linux_sdk/linux/include/linux/pinctrl/machine.h \
  /home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.h \

/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o: $(deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o)

$(deps_/home/dev/Nuclei/linux_sdk/linux/drivers/net/ethernet/fsl/epon_olt_mac.o):
