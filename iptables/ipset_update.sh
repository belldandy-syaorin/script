#!/bin/bash
if [ -f /opt/ipset/cn.zone ] ; then
	echo "[info] Update blacklistcn"
	echo "[info] cn.zone :" $(wc -l /opt/ipset/cn.zone | awk '{print $1}')
	ipset create blacklistcn_update hash:net
	for i in $(cat /opt/ipset/cn.zone) ; do ipset add blacklistcn_update $i ; done
	ipset swap blacklistcn blacklistcn_update
	ipset destroy blacklistcn_update
	ipset save > /etc/ipset.conf
	echo "[info] ipset.conf :" $(wc -l /etc/ipset.conf | awk '{print $1}')
else
	echo "[info] Can't Find cn.zone & Exit"
	exit 0
fi
if [ -f /opt/ipset/tw.zone ] ; then
	echo "[info] Update blacklisttw"
	echo "[info] tw.zone :" $(wc -l /opt/ipset/tw.zone | awk '{print $1}')
	ipset create blacklisttw_update hash:net
	for i in $(cat /opt/ipset/tw.zone) ; do ipset add blacklisttw_update $i ; done
	ipset swap blacklisttw blacklisttw_update
	ipset destroy blacklisttw_update
	ipset save > /etc/ipset.conf
	echo "[info] ipset.conf :" $(wc -l /etc/ipset.conf | awk '{print $1}')
else
	echo "[info] Can't Find tw.zone & Exit"
	exit 0
fi
exit 0