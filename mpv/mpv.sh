#!/bin/bash
declare -a argument

function argumentselect() {
while [ -z "${argument[0]}" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = --fullscreen (Default , No Input & Press Enter)"
echo "2 = --audio-display=no --shuffle"
echo "3 = --vid=no --shuffle"
echo "4 = --audio-display=no --loop-file=inf"
echo "5 = --vid=no --loop-file=inf"
echo "6 = --vid=no --aid=2"
echo "7 = --vid=no --aid=3"
echo "8 = --window-scale=0.5"
echo "9 = --window-scale=1.5"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	as="1"
fi
checkas=$(echo "${as:0:1}"|grep '^[[:digit:]]')
case $checkas in
	"0")
		exit 0
	;;
	"1")
		argument[0]="--fullscreen"
	;;
	"2")
		argument[0]="--audio-display=no"
		argument[1]="--shuffle"
	;;
	"3")
		argument[0]="--vid=no"
		argument[1]="--shuffle"
	;;
	"4")
		argument[0]="--audio-display=no"
		argument[1]="--loop-file=inf"
	;;
	"5")
		argument[0]="--vid=no"
		argument[1]="--loop-file=inf"
	;;
	"6")
		argument[0]="--vid=no"
		argument[1]="--aid=2"
	;;
	"7")
		argument[0]="--vid=no"
		argument[1]="--aid=3"
	;;
	"8")
		argument[0]="--window-scale=0.5"
	;;
	"9")
		argument[0]="--window-scale=1.5"
	;;
esac
done
}

if [ -z "$1" ] ; then
	echo "[info] argument : --player-operation-mode=pseudo-gui --window-scale=0.5"
	mpv --player-operation-mode=pseudo-gui --window-scale=0.5 &
	exit 0
else
	argumentselect
	if [ -z "${argument[1]}" ] ; then
		echo "[info] argument : ${argument[0]}"
		mpv "$1" "${argument[0]}"
	else
		echo "[info] argument : ${argument[0]} ${argument[1]}"
		mpv "$1" "${argument[0]}" "${argument[1]}"
	fi
fi
exit 0
