#!/bin/bash
declare -a argument
	argument[0]="$(hg log --limit 2|grep changeset:)"
	argument[1]="$(echo "${argument[0]}"|awk NR==1'{printf "%s\n",$2}')"
	argument[2]="$(echo "${argument[0]}"|awk NR==2'{printf "%s\n",$2}')"
if [ "${argument[0]}" = "" -o "${argument[1]}" = "" ] ; then
	echo "[info] Repository Log : n/a"
	exit 0
fi
echo "[info] Repository Log"
hg qlog
echo "[info] Repository Revision(Last 2) :" "${argument[1]}" "${argument[2]}"
read -t 5 -p "[info] Log View(Last 2 & Use KDiff3) = Y/y Or Exit = Other(After 5s Will Auto Exit) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [ "$checkans" = "Y" -o "$checkans" = "y" ] ; then
	echo "[info] Log View(Last 2 & Use KDiff3)"
	hg kdiff3 -r"${argument[1]}" -r"${argument[2]}"
else
	echo "[info] Exit"
fi
exit 0
