#!/bin/bash
declare -a argument
	argument[2]="--check-certificate=false"
	argument[3]="--dir=$HOME/Downloads" #download path
	argument[4]="--remote-time=true"

function checksetting() {
	if [ -f /usr/bin/aria2c ] ; then
		argument[0]="/usr/bin/aria2c"
	elif [ -f /usr/local/bin/aria2c ] ; then
		argument[0]="/usr/local/bin/aria2c"
	else
		echo "[info] Can't Find aria2c & Exit"
		exit 0
	fi
	dlpath=$(echo "${argument[3]}"|sed 's/--dir=//g')
	if [ ! -d "$dlpath" ] ; then
		echo "[info] Can't Find Download Directory & Exit"
		exit 0
	fi
}

function manualinputargument() {
	read -p "Null(Empty) = Exit , Manual Input (Link) : " mia
	argument[1]="$mia"
	if [ -z "${argument[1]}" ] ; then
		exit 0
	fi
}

function speedselect() {
while [ "${argument[5]}" = "" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = Unrestricted"
echo "2 = 512K (Default , No Input & Press Enter)"
echo "3 = 256K"
echo "4 = 128K"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ "$as" = "" ] ; then
	as="2"
fi
checkas=$(echo "${as:0:1}"|grep '^[[:digit:]]')
case $checkas in
	"0")
		exit 0
	;;
	"1")
		argument[5]="--max-download-limit=0"
	;;
	"2")
		argument[5]="--max-download-limit=512K"
	;;
	"3")
		argument[5]="--max-download-limit=256K"
	;;
	"4")
		argument[5]="--max-download-limit=128K"
	;;
esac
done
}

checksetting
if [ -z "$1" ] ; then
	manualinputargument
	speedselect
	"${argument[0]}" "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "${argument[1]}"
else
	speedselect
	"${argument[0]}" "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "$1"
fi
exit 0
