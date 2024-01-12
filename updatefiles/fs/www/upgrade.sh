#!/bin/bash

if [ -d /tmp/updatefiles ] ; then
echo "tar file to /tmp/updatefiles"
else
mkdir /tmp/updatefiles
fi

tar -xf /tmp/upgradefile.tar -C /tmp/updatefiles

cd /tmp/updatefiles
result=`fw_printenv -n bootcmd`

if [ "$result" == "run bootcmd_ubifs_boot" ]; then

echo "cp lib and usr/sbin and www"
cp -a fs/lib/* /lib
cp -a fs/usr/sbin/* /usr/sbin
mv fs/www/images/logo.png /mnt
mv fs/www/images/logo_maiwe_en.jpg /mnt
cp -a fs/www/ /usr

echo "cp etc and start script and db"
mv etc/version	 /mnt
cp -a etc/* /usr/etc
cp -a rootetc/*.sh /mnt
cp -a fs/*.db  /mnt

echo "cp libsdk.so"
cp -a libsdk.so  /root
sync

else
	if [ -f initrd.bin ] ; then
		if [ "$result" == "run bootcmd_nor" ]; then
		flash_erase /dev/mtd2 0 0
		flashcp -v initrd.bin  /dev/mtd2
		elif [ "$result" == "run bootcmd_nand" ]; then
		flash_erase /dev/mtd5 0 0
		flashcp -v initrd.bin  /dev/mtd5
		fi
		cp -af S40initconfig.sh /mnt
		echo "cp S40initconfig.sh to mnt"	
		cp -af config.fhme /mnt
		echo "cp config.fhme to mnt"
		cp -af config_reg.txt /mnt
		echo "cp config_reg.txt to mnt"
		cp -af config_default.db /mnt
		echo "cp config_default.db to mnt"	
		cp -af logo.png /mnt
		echo "cp logo.png to mnt"
		cp -af logo_maiwe_en.jpg /mnt
		echo "cp logo_maiwe_en.jpg to mnt"
		cp -af version /mnt
		echo "cp version to mnt"
		sync
		echo "upgrade done!"
	fi
fi

sed -i "s/upgrading=./upgrading=3/"  /tmp/upgrade_flag
echo "upgrade done!"


