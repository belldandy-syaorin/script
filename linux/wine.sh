#!/bin/bash
if [[ ! "$1" =~ ^.+\.(exe|EXE)$ ]] ; then
	echo "[info] Not executable & Exit"
	exit 0
fi
if [[ "$2" =~ ^dxvk$ ]] ; then
	DXVK_HUD=full LANG=ja_JP.UTF-8 wine $1
else
	LANG=ja_JP.UTF-8 wine $1
fi
exit 0
