#!/bin/bash
declare -a argument
if [[ ! $1 =~ ^192\.168(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){2}$ ]] ; then
	echo "[info] Not 192.168.*.* & Exit"
	exit 0
fi

function sizeselect() {
while [ "${argument[0]}" = "" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = /size:1280x960 (Default , No Input & Press Enter)"
echo "2 = /size:80%"
echo "3 = /f"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ "$as" = "" ] ; then
	as="1"
fi
checkas=$(echo "${as:0:1}"|grep '^[[:digit:]]')
case $checkas in
	"0")
		exit 0
	;;
	"1")
		argument[0]="/size:1280x960"
	;;
	"2")
		argument[0]="/size:80%"
	;;
	"3")
		argument[0]="/f"
	;;
esac
done
}

sizeselect
echo "[info] xfreerdp +clipboard +fonts -themes -wallpaper ${argument[0]} /v:$1"
xfreerdp +clipboard +fonts -themes -wallpaper "${argument[0]}" /v:$1
exit 0
