#!/bin/bash
declare -a argument
	argument[0]="$(hg log --limit 2|grep changeset:)"
	argument[1]="$(echo "${argument[0]}"|awk NR==1'{printf "%s\n",$2}')"
	argument[2]="$(echo "${argument[0]}"|awk NR==2'{printf "%s\n",$2}')"
if [ "${argument[0]}" = "" -o "${argument[1]}" = "" ] ; then
	echo "[info] Repository Log : n/a"
	exit 0
fi
echo "[info] Repository Log(Last 2)"
hg qlog
echo "[info] Repository Changeset(Last 2) :" "${argument[1]}" "${argument[2]}"
echo "[info] Diff View(Last 2 & Use KDiff3 ,GUI) = K/k Or"
echo "[info] Diff View(Last 2 & Use VIM ,CLI) = V/v Or"
read -t 5 -p "[info] Exit = Other (After 5s Will Auto Exit ,Default) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [ "$checkans" = "K" -o "$checkans" = "k" ] ; then
	echo "[info] Select : Diff View(Last 2 & Use KDiff3 ,GUI)"
	hg kdiff3 -r"${argument[1]}" -r"${argument[2]}"
elif [ "$checkans" = "V" -o "$checkans" = "v" ] ; then
	echo "[info] Select : Diff View(Last 2 & Use VIM ,CLI)"
	hg vimdiff -r"${argument[1]}" -r"${argument[2]}"
else
	echo ""
	echo "[info] Exit"
fi
exit 0
