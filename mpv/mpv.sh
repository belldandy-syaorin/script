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
echo "1 = --audio-display=no --geometry=1280x720 --loop-file=inf (Default for flac & mp3 & privatepl)"
echo "2 = --loop-file=inf" --vid=no
echo "3 = --audio-display=no --geometry=1280x720 --loop-playlist=inf (Default for multiple file (flac & mp3))"
echo "4 = --loop-playlist=inf --vid=no (Default for multiple file (mkv & mp4))"
echo "5 = --audio-display=no --geometry=1280x720 --loop-playlist=inf --shuffle (Default for m3u8)"
echo "6 = --loop-playlist=inf --shuffle --vid=no"
echo "7 = --fullscreen"
echo "8 = --autofit-larger=1280x720 --volume=25"
echo "9 = --geometry=1280x720 --volume=25"
read -t 5 -p "Select Feature (0 = Exit) : " as
if [ -z "$as" ] ; then
	if [ -z "$fn" ] ; then
		as="1"
	elif [ "${#fnl[@]}" -eq 1 ] ; then
		if [[ "$fne" =~ ^(flac|mp3)$ ]] ; then
			as="1"
		elif [[ "$fne" =~ ^m3u8$ ]] ; then
			as="5"
		fi
	elif [ "${#fnl[@]}" -ge 2 ] ; then
		if [[ "$fne" =~ ^(flac|mp3)$ ]] ; then
			as="3"
		elif [[ "$fne" =~ ^(mkv|mp4)$ ]] ; then
			as="4"
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
			argument[1]="--geometry=1280x720"
			argument[2]="--loop-file=inf"
		;;
		"2")
			argument[0]="--loop-file=inf"
			argument[1]="--vid=no"
		;;
		"3")
			argument[0]="--audio-display=no"
			argument[1]="--geometry=1280x720"
			argument[2]="--loop-playlist=inf"
		;;
		"4")
			argument[0]="--loop-playlist=inf"
			argument[1]="--vid=no"
		;;
		"5")
			argument[0]="--audio-display=no"
			argument[1]="--geometry=1280x720"
			argument[2]="--loop-playlist=inf"
			argument[3]="--shuffle"
		;;
		"6")
			argument[0]="--loop-playlist=inf"
			argument[1]="--shuffle"
			argument[2]="--vid=no"
		;;
		"7")
			argument[0]="--fullscreen"
		;;
		"8")
			argument[0]="--autofit-larger=1280x720"
			argument[1]="--volume=25"
		;;
		"9")
			argument[0]="--geometry=1280x720"
			argument[1]="--volume=25"
		;;
	esac
fi
done
}

argumentselect
echo "[info] playlist : ${#fnl[@]}"
printf '\t%s\n' "${fnl[@]}"
echo "[info] argument : ${argument[@]}"
mpv "${fnl[@]}" "${argument[@]}"
exit 0
