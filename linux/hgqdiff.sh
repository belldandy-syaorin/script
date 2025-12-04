#!/bin/bash
declare -a argument
	argument[0]="$(hg log --limit 2|grep changeset:)"
	argument[1]="$(echo "${argument[0]}"|awk NR==1'{printf "%s\n",$2}')"
	argument[2]="$(echo "${argument[0]}"|awk NR==2'{printf "%s\n",$2}')"
if [ -z "${argument[1]}" -o -z "${argument[2]}" ] ; then
	echo "[info] Repository Log : n/a"
	echo "[info] Exit"
	exit 0
fi
echo "[info] Repository Log(Last 2)"
hg log --graph --limit 2 --stat
echo "[info] Repository Changeset(Last 2) Diff :" "${argument[1]}" "${argument[2]}"
echo "g = GVIM , k = KDiff3 , n = NVIM , v = VIM (After 5s Will Auto Exit)"
read -t 5 -p "Select Feature (Not k/v or No Input = Exit) : " ans
case $ans in
	"g")
		echo "[info] GVIM"
		hg gvimdiff -r"${argument[1]}" -r"${argument[2]}"
		exit 0
	;;
	"k")
		echo "[info] KDiff3"
		hg kdiff3 -r"${argument[1]}" -r"${argument[2]}"
		exit 0
	;;
	"n")
		echo "[info] NVIM"
		hg nvimdiff -r"${argument[1]}" -r"${argument[2]}"
		exit 0
	;;
	"v")
		echo "[info] VIM"
		hg vimdiff -r"${argument[1]}" -r"${argument[2]}"
		exit 0
	;;
	"*")
		echo "[info] Exit"
		exit 0
	;;
esac
echo "Exit (Auto)"
echo "[info] Exit"
exit 0
