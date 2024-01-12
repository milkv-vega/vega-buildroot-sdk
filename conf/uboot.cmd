echo 'Loading kernel'
fatload mmc 0 0x42000000 uImage.lz4
echo 'Loading ramdisk'
fatload mmc 0 0x48300000 uInitrd.lz4
echo 'Loading dtb'
fatload mmc 0 0x48000000 kernel.dtb
setenv bootargs 'earlycon=sbi console=ttySIF0'
echo 'Starts booting from SD'
bootm 0x42000000 0x48300000 0x48000000
