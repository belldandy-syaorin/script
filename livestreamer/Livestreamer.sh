#!/bin/bash
declare -a argument

function siteselect() {
while [ "${argument[0]}" = "" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = youtube (Default , No Input & Press Enter)"
echo "2 = twitch"
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
		argument[0]="best"
	;;
	"2")
		argument[0]="source"
	;;
esac
done
}

function playerselect() {
while [ "${argument[1]}" = "" ]
do
echo "Input A Number For Your Choice (After 5s Will Auto Select Default)"
echo "1 = mpv (Default , No Input & Press Enter)"
echo "2 = vlc"
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
		argument[1]="--player=mpv"
	;;
	"2")
		argument[1]="--player=vlc"
	;;
esac
done
}

siteselect
playerselect
livestreamer $1 "${argument[0]}" "${argument[1]}"
exit 0
