#!/bin/bash
if [ -f /etc/sysconfig/ipset.conf ] ; then
	savepath="/etc/sysconfig/ipset.conf"
else
	savepath="/etc/ipset.conf"
fi
cnpath="/opt/ipset/cn.zone"
twpath="/opt/ipset/tw.zone"
if [ -f $cnpath ] ; then
	echo "[info] Create & Update blacklistcn"
	echo "[info] cn.zone :" $(wc -l $cnpath | awk '{print $1}')
	ipset -exist create blacklistcn hash:net
	ipset create blacklistcn_update hash:net
	for i in $(cat $cnpath) ; do ipset add blacklistcn_update $i ; done
	ipset swap blacklistcn blacklistcn_update
	ipset destroy blacklistcn_update
	ipset save > $savepath
	echo "[info] ipset.conf :" $(wc -l $savepath | awk '{print $1}')
else
	echo "[info] Can't Find cn.zone & Exit"
	exit 0
fi
if [ -f $twpath ] ; then
	echo "[info] Create & Update blacklisttw"
	echo "[info] tw.zone :" $(wc -l $twpath | awk '{print $1}')
	ipset -exist create blacklisttw hash:net
	ipset create blacklisttw_update hash:net
	for i in $(cat $twpath) ; do ipset add blacklisttw_update $i ; done
	ipset swap blacklisttw blacklisttw_update
	ipset destroy blacklisttw_update
	ipset save > $savepath
	echo "[info] ipset.conf :" $(wc -l $savepath | awk '{print $1}')
else
	echo "[info] Can't Find tw.zone & Exit"
	exit 0
fi
exit 0
