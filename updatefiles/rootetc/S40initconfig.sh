#!/bin/sh

echo "initconfig start ..."
insmod /root/xy1000_net.ko net_port=40
insmod /root/led_164.ko
#insmod /root/led_164.ko gpio_preventloop=16 gpio_rst=8
#cp -f /usr/etc/mac /mnt/mac

ifconfig lo 127.0.0.1
route add -net 127.0.0.0 netmask 255.255.0.0 lo > /dev/null 2>&1

#cp -a /usr/www /tmp
mkdir /tmp/www

if [ ! -d /usr/www/tmp ]; then
ln -s /tmp/www /usr/www/tmp
fi
#cp /root/libsdk.so /lib/
if [ ! -f /lib/libsdk.so ]; then
ln -s /root/libsdk.so /lib/libsdk.so
fi

#modify inittab: not running rcK when reboot
#sed -i '/::shutdown:\/etc\/init.d\/rcK/d' /etc/inittab
sync

ifconfig eth0 down
ifconfig eth0 hw ether 00:02:a3:f2:10:00
ifconfig eth0 192.168.16.35
ifconfig eth0 up

ifconfig vir0 down
ifconfig vir0 hw ether `/usr/sbin/flash_mac -l`
ifconfig vir0 up

#todo:need to get /tmp/config.db in rc.c, this just for debug
if [ -f /mnt/config_usr.db ]
then
	cp /mnt/config_usr.db /tmp/config.db
else
	cp /mnt/config_default.db /tmp/config.db
fi

/usr/sbin/rc start
echo "rc start ..."
/usr/sbin/syslogd -f /usr/etc/syslog.conf > /dev/null
cat /root/config_reg.txt | /root/fhcli

/usr/sbin/cmd_agent_ap
/usr/sbin/pkt_handle > /dev/null &
#/usr/sbin/preventloop > /dev/null &

sync
sync
sync
