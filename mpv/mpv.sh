#!/bin/bash
declare -a argument
fn=$(basename "$1")
fne="${fn##*.}"
fnl=("$@")
privatepl="$HOME/.config/mpv/privatepl"
if [ -z "$1" ] ; then
	if [ ! -f "$privatepl" ] ; then
		echo "[info] Can't Find playlist & Exit"
		exit 0
	else
		readarray -t fnl < "$privatepl"
	fi
fi

function argumentselect() {
while [ -z "${argument[0]}" ]
do
echo "[info] Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = --audio-display=no --shuffle --volume=50 (Default for m3u8)"
echo "2 = --vid=no --shuffle (Default for m3u)"
echo "3 = --audio-display=no --loop-file=inf --volume=50 (Default for flac & mp3 & privatepl)"
echo "4 = --vid=no --loop-file=inf"
echo "5 = --audio-display=no --loop-playlist=inf --volume=50 (Default for multiple file (flac & mp3))"
echo "6 = --vid=no --loop-playlist=inf (Default for multiple file (mkv & mp4))"
echo "7 = --fullscreen"
echo "8 = --window-scale=0.5"
echo "9 = --window-scale=0.75"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	if [ -z "$fn" ] ; then
		as="3"
	elif [ "${#fnl[@]}" -eq 1 ] ; then
		if [[ "$fne" =~ ^m3u8$ ]] ; then
			as="1"
		elif [[ "$fne" =~ ^m3u$ ]] ; then
			as="2"
		elif [[ "$fne" =~ ^(flac|mp3)$ ]] ; then
			as="3"
		fi
	elif [ "${#fnl[@]}" -ge 2 ] ; then
		if [[ "$fne" =~ ^(flac|mp3)$ ]] ; then
			as="5"
		elif [[ "$fne" =~ ^(mkv|mp4)$ ]] ; then
			as="6"
		fi
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
			argument[0]="--audio-display=no"
			argument[1]="--shuffle"
			argument[2]="--volume=50"
		;;
		"2")
			argument[0]="--vid=no"
			argument[1]="--shuffle"
		;;
		"3")
			argument[0]="--audio-display=no"
			argument[1]="--loop-file=inf"
			argument[2]="--volume=50"
		;;
		"4")
			argument[0]="--vid=no"
			argument[1]="--loop-file=inf"
		;;
		"5")
			argument[0]="--audio-display=no"
			argument[1]="--loop-playlist=inf"
			argument[2]="--volume=50"
		;;
		"6")
			argument[0]="--vid=no"
			argument[1]="--loop-playlist=inf"
		;;
		"7")
			argument[0]="--fullscreen"
		;;
		"8")
			argument[0]="--window-scale=0.5"
		;;
		"9")
			argument[0]="--window-scale=0.75"
		;;
	esac
fi
done
}

argumentselect
if [ ! -z "${argument[2]}" ] && [[ "$fne" =~ ^flac$ ]] ; then
	argument[2]="--volume=75"
fi
if [ -z "${argument[1]}" ] ; then
	echo "[info] playlist : ${#fnl[@]}"
	printf '\t%s\n' "${fnl[@]}"
	echo "[info] argument : ${argument[0]}"
	mpv "${fnl[@]}" "${argument[0]}"
elif [ -z "${argument[2]}" ] ; then
	echo "[info] playlist : ${#fnl[@]}"
	printf '\t%s\n' "${fnl[@]}"
	echo "[info] argument : ${argument[0]} ${argument[1]}"
	mpv "${fnl[@]}" "${argument[0]}" "${argument[1]}"
else
	echo "[info] playlist : ${#fnl[@]}"
	printf '\t%s\n' "${fnl[@]}"
	echo "[info] argument : ${argument[0]} ${argument[1]} ${argument[2]}"
	mpv "${fnl[@]}" "${argument[0]}" "${argument[1]}" "${argument[2]}"
fi
exit 0
