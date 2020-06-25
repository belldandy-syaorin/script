#!/bin/bash
if [[ ! "$1" =~ ^.+\.(exe|EXE)$ ]] ; then
	echo "[info] Not executable & Exit"
	exit 0
fi
if [[ "$2" =~ ^fps$ ]] ; then
	DXVK_HUD=fps LANG=ja_JP.UTF-8 WINEDLLOVERRIDES="d3d10_1,d3d10core,d3d10,d3d11,d3d9,dxgi=n" wine "$1"
elif [[ "$2" =~ ^full$ ]] ; then
	DXVK_HUD=full LANG=ja_JP.UTF-8 WINEDLLOVERRIDES="d3d10_1,d3d10core,d3d10,d3d11,d3d9,dxgi=n" wine "$1"
else
	LANG=ja_JP.UTF-8 wine "$1"
fi
exit 0
