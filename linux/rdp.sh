#!/bin/bash
if [[ ! $1 =~ ^192\.168(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){2}$ ]] ; then
	echo "[info] Not 192.168.*.* & Exit"
	exit 0
fi
echo "[info] xfreerdp +clipboard +fonts -themes -wallpaper /size:80% /v:$1"
xfreerdp +clipboard +fonts -themes -wallpaper /size:80% /v:$1
exit 0
