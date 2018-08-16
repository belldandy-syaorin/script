#!/bin/bash
declare -a argument
fn=$(basename "$1")
fne="${fn##*.}"
fnl=("$@")

function argumentselect() {
while [ -z "${argument[0]}" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = --fullscreen (Default for mkv & mp4)"
echo "2 = --audio-display=no --shuffle (Default for m3u8)"
echo "3 = --vid=no --shuffle (Default for m3u)"
echo "4 = --audio-display=no --loop-file=inf (Default for flac & mp3)"
echo "5 = --vid=no --loop-file=inf"
echo "6 = --window-scale=0.5"
echo "7 = --window-scale=0.8"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	if [[ "$fne" =~ ^(mkv|mp4)$ ]] ; then
		as="1"
	elif [[ "$fne" =~ ^m3u8$ ]] ; then
		as="2"
	elif [[ "$fne" =~ ^m3u$ ]] ; then
		as="3"
	elif [[ "$fne" =~ ^(flac|mp3)$ ]] ; then
		as="4"
	else
		as="0"
	fi
	echo "$as (Auto)"
fi
if [[ "$as" =~ [0-9] ]] ; then
	case $as in
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
			argument[0]="--window-scale=0.5"
		;;
		"7")
			argument[0]="--window-scale=0.8"
		;;
	esac
fi
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
		echo "[info] playlist :"
		printf '\t%s\n' "${fnl[@]}"
		mpv "${fnl[@]}" "${argument[0]}"
	else
		echo "[info] argument : ${argument[0]} ${argument[1]}"
		echo "[info] playlist :"
		printf '\t%s\n' "${fnl[@]}"
		mpv "${fnl[@]}" "${argument[0]}" "${argument[1]}"
	fi
fi
exit 0
