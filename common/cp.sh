#!/bin/bash

# make cleanfreeloader
# make cleanboot

pushd $(dirname "$0")

echo "###Generating rootfs###"

function show_usage
{
echo "usage: ./cp.sh [arg1]
arg1 (default ubifs)
	help:	show usage
  	ubifs:  ubifs mount on nand flash, all the changes can be saved
  	ramfs:  ramfs run in nor flash, while mount jffs2 on nor;
          	or ramfs run in nand flash, while mount ubifs on nand
  	entire: ramfs run in nor flash, all the changes can not be saved
arg2 
	web:	white box"
exit
}

if [ -z $1 ]; 
then
arg1='ubifs'
echo "use default param. \"./cp.sh help\" for detail info"
else
arg1="$1"
fi

if [ -z $2 ]; 
then
arg2='null'
else
arg2="$2"
fi

echo "rootfs: $arg1 $arg2"

if [ $arg1 != "ubifs" ] && [ $arg1 != "ramfs" ] && [ $arg1 != "entire" ]; 
then
show_usage
pushd
fi

echo "1.gen sh"
rm -rf userconfig.sh
rm -rf S30initconfig.sh
touch userconfig.sh
touch S30initconfig.sh
echo "#Auto generated, please don't change it!
export PS1='\[\e[1;32;40m\]\u@dev:\$PWD> \[\e[0m\]'
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/root" >> userconfig.sh

echo "dropbear -p 22 -d /etc/dropbear/dropbear_dss_host_key -r /etc/dropbear/dropbear_rsa_host_key
export LD_LIBRARY_PATH=:/root">> S30initconfig.sh

if [ $arg1 = "ramfs" ]; 
then	
echo "result=\`fw_printenv -n bootcmd\`
if [ \"\$result\" == \"run bootcmd_nor\" ]
then
	echo \"mount on nor flash with jffs2\"
	mount -t jffs2 /dev/mtdblock3 /mnt/
elif [ \"\$result\" == \"run bootcmd_nand\" ]
then
	echo \"mount on nand flash with ubifs\"
	ubiattach -m 6 /dev/ubi_ctrl
	mount -t ubifs /dev/ubi0_0 /mnt/
else
	echo \"no mount\"
fi" >> S30initconfig.sh
rm -rf ../work/buildroot_initramfs_sysroot/mnt/*
else
if [ $arg2 != "web" ]; 	
then
echo "#Auto generated, please don't change it!
#insmod /root/fh_pcie2pata.ko
insmod /root/led_164.ko
insmod /root/xy1000_net.ko net_port=0
ifconfig eth0 down
ifconfig eth0 hw ether 00:02:AA:BF:CC:45
ifconfig eth0 up
ifconfig eth0 12.26.0.113 netmask 255.255.0.0
ifconfig vir0 down
ifconfig vir0 hw ether 00:02:AA:BF:CC:46
ifconfig vir0 up
ifconfig vir0 192.168.1.100 netmask 255.255.255.0
/root/fhcli" >> S30initconfig.sh
else
cp -a  version ../work/buildroot_initramfs_sysroot/mnt/
cp -a  config_default.db ../work/buildroot_initramfs_sysroot/mnt/
cp -a  S40initconfig.sh ../work/buildroot_initramfs_sysroot/mnt/
#cp -a  logo.png ../work/buildroot_initramfs_sysroot/mnt/
#cp -a  logo_maiwe_en.jpg ../work/buildroot_initramfs_sysroot/mnt/
fi
fi

echo "cd /root
if [ ! -f config.fhme ]; then
ln -s /mnt/config.fhme config.fhme
fi

if [ ! -f config_reg.txt ]; then
ln -s /mnt/config_reg.txt  config_reg.txt
fi
" >> S30initconfig.sh

echo "2.clean /root and /dev of rootfs"
rm -rf ../work/buildroot_initramfs_sysroot/root/*
rm -rf ../work/buildroot_initramfs_sysroot/dev

echo "3.cp file to rootfs"
if [ $arg1 = "ubifs" ] || [ $arg1 = "entire" ]; 
then
cp -a  config.fhme ../work/buildroot_initramfs_sysroot/mnt/
cp -a  config_reg.txt ../work/buildroot_initramfs_sysroot/mnt/
fi

if [ $arg2 = "web" ];
then
#rm -f ../work/buildroot_initramfs_sysroot/usr/www/images/logo.png
#rm -f ../work/buildroot_initramfs_sysroot/usr/www/images/logo_maiwe_en.jpg
#ln -s /mnt/logo.png  ../work/buildroot_initramfs_sysroot/usr/www/images/logo.png
#ln -s /mnt/logo_maiwe_en.jpg  ../work/buildroot_initramfs_sysroot/usr/www/images/logo_maiwe_en.jpg
ln -sf /mnt/S40initconfig.sh  ../work/buildroot_initramfs_sysroot/etc/init.d/S40initconfig.sh
fi

# cp fh_pcie2pata.ko ../work/buildroot_initramfs_sysroot/root/
cp -a libsdk.so ../work/buildroot_initramfs_sysroot/root/
cp -a i2c* ../work/buildroot_initramfs_sysroot/root/
cp -a ./dev ../work/buildroot_initramfs_sysroot/dev -frd
chmod 755 ../work/buildroot_initramfs_sysroot/bin/busybox
cp -a led_164.ko ../work/buildroot_initramfs_sysroot/root/
cp -a xy1000_net.ko ../work/buildroot_initramfs_sysroot/root/
cp -a fhcli ../work/buildroot_initramfs_sysroot/root/
chmod 777 -R ../work/buildroot_initramfs_sysroot/root/
#cp sdk_inf ../work/buildroot_initramfs_sysroot/root/
cp -a iptables ../work/buildroot_initramfs_sysroot/usr/sbin/
cp -a i2c_dev_msg_muti  ../work/buildroot_initramfs_sysroot/usr/sbin/
chmod 777 ../work/buildroot_initramfs_sysroot/usr/sbin/i2c_dev_msg_muti
cp -a config_pll.sh ../work/buildroot_initramfs_sysroot/root/
cp -a fw_env.config ../work/buildroot_initramfs_sysroot/etc/
cp -a fw_printenv ../work/buildroot_initramfs_sysroot/usr/bin/
cd ../work/buildroot_initramfs_sysroot/usr/bin
rm -rf fw_setenv
ln -s fw_printenv fw_setenv
cd ../../../../install/
cp -a S30initconfig.sh ../work/buildroot_initramfs_sysroot/etc/init.d/
cp -a userconfig.sh ../work/buildroot_initramfs_sysroot/etc/profile.d/

echo "4.add ssh & scp to rootfs"
cp -rf dropbear/bin/* ../work/buildroot_initramfs_sysroot/usr/bin/
cp -rf dropbear/sbin/* ../work/buildroot_initramfs_sysroot/usr/sbin/
cp -rf zlib/lib/libz.so* ../work/buildroot_initramfs_sysroot/lib/
if [ -d ../work/buildroot_initramfs_sysroot/etc/dropbear ]; 
then
echo "  etc/dropbear already exists"
else
mkdir ../work/buildroot_initramfs_sysroot/etc/dropbear
fi
cp -rf dropbear_rsa_host_key ../work/buildroot_initramfs_sysroot/etc/dropbear
cp -rf dropbear_dss_host_key ../work/buildroot_initramfs_sysroot/etc/dropbear

if [ $arg1 = "ubifs" ]; 
then
echo "5.generating ubifs rootfs"
cd ../work
rm -rf ubifs.img
mkfs.ubifs -F -m 2048 -e 124KiB -c 320 -r ./buildroot_initramfs_sysroot ubifs.img
echo "done! rootfs is work/ubifs.img"
else
echo "5.Ready, please run the following command to genarate initrd.bin:
	make cleanboot
	make cleanfreeloader
	make freeloader"
fi

pushd

