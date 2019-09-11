#!/bin/bash
declare -a argument
if [[ ! "$1" =~ ^192\.168(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){2}$ ]] ; then
	echo "[info] Not 192.168.*.* & Exit"
	exit 0
fi

function sizeselect() {
while [ -z "${argument[0]}" ]
do
echo "[info] Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = /f"
echo "2 = /size:1024x768"
echo "3 = /size:1280x960 (Default)"
echo "4 = /size:50%"
echo "5 = /size:80%"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	as="3"
	echo "$as (Auto)"
fi
if [[ "$as" =~ [0-9] ]] ; then
	case $as in
		"0")
			exit 0
		;;
		"1")
			argument[0]="/f"
		;;
		"2")
			argument[0]="/size:1024x768"
		;;
		"3")
			argument[0]="/size:1280x960"
		;;
		"4")
			argument[0]="/size:50%"
		;;
		"5")
			argument[0]="/size:80%"
		;;
	esac
fi
done
}

sizeselect
echo "[info] server : $1"
echo "[info] argument : ${argument[0]}"
xfreerdp +clipboard +fonts -themes -wallpaper "${argument[0]}" /v:$1
exit 0
