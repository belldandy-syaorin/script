#!/bin/bash
declare -a argument
	argument[2]="--check-certificate=false"
	argument[3]="--dir=$HOME/Downloads" #download path
	argument[4]="--remote-time=true"
	argument[6]="--referer="

function checksetting() {
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
while [ -z "${argument[5]}" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = Unrestricted"
echo "2 = 2048K (Default)"
echo "3 = 1024K"
echo "4 = 512K"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	as="2"
	echo "$as (Auto)"
fi
if [[ "$as" =~ [0-9] ]] ; then
	case $as in
		"0")
			exit 0
		;;
		"1")
			argument[5]="--max-download-limit=0"
		;;
		"2")
			argument[5]="--max-download-limit=2048K"
		;;
		"3")
			argument[5]="--max-download-limit=1024K"
		;;
		"4")
			argument[5]="--max-download-limit=512K"
		;;
	esac
fi
done
}

checksetting
if [ -z "$1" ] ; then
	manualinputargument
	speedselect
	echo "[info] URI : ${argument[1]}"
	aria2c "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "${argument[1]}"
else
	speedselect
	echo "[info] URI : $1"
	aria2c "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "$1" "${argument[6]}""$2"
fi
exit 0
