#!/bin/bash
declare -a argument
	argument[0]="--referer="
	argument[1]="--check-certificate=false"
	argument[2]="--dir=$HOME/Downloads" #download path
	argument[3]="--remote-time=true"

function checksetting() {
	dlpath=$(echo "${argument[2]}"|sed 's/--dir=//g')
	if [ ! -d "$dlpath" ] ; then
		echo "[info] Can't Find Download Directory & Exit"
		exit 0
	fi
}

function uriinput() {
	read -p "[info] URI Input (No Input = Exit) : " ui
	if [ -z "$ui" ] ; then
		echo "[info] Exit"
		exit 0
	fi
}

function refererinput() {
	read -p "[info] REFERER Input (No Input = Skip) : " ri
}

function speedselect() {
while [ -z "${argument[4]}" ]
do
echo "[info] Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = --max-download-limit=0 --max-upload-limit=0"
echo "2 = --max-download-limit=2048K --max-upload-limit=512K (Default)"
echo "3 = --max-download-limit=1024K --max-upload-limit=256K"
echo "4 = --max-download-limit=512K --max-upload-limit=128K"
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
			argument[4]="--max-download-limit=0"
			argument[5]="--max-upload-limit=0"
		;;
		"2")
			argument[4]="--max-download-limit=2048K"
			argument[5]="--max-upload-limit=512K"
		;;
		"3")
			argument[4]="--max-download-limit=1024K"
			argument[5]="--max-upload-limit=256K"
		;;
		"4")
			argument[4]="--max-download-limit=512K"
			argument[5]="--max-upload-limit=128K"
		;;
	esac
fi
done
}

checksetting
if [ -z "$1" ] ; then
	uriinput
	refererinput
	speedselect
	if [ -z "$ri" ] ; then
		echo "[info] URI : $ui"
		echo "[info] argument : ${argument[4]} ${argument[5]}"
		aria2c "${argument[1]}" "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "$ui"
	else
		echo "[info] URI : $ui"
		echo "[info] REFERER : $ri"
		echo "[info] argument : ${argument[4]} ${argument[5]}"
		aria2c "${argument[1]}" "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "$ui" "${argument[0]}""$ri"
	fi
else
	speedselect
	echo "[info] URI : $1"
	echo "[info] REFERER : $2"
	echo "[info] argument : ${argument[4]} ${argument[5]}"
	aria2c "${argument[1]}" "${argument[2]}" "${argument[3]}" "${argument[4]}" "${argument[5]}" "$1" "${argument[0]}""$2"
fi
exit 0
