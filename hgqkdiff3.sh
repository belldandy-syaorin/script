#!/bin/bash
declare -a argument
	argument[0]="$(hg log --limit 2|grep changeset:|awk NR==1'{printf "%s\n",$2}')"
	argument[1]="$(hg log --limit 2|grep changeset:|awk NR==2'{printf "%s\n",$2}')"
if [ "${argument[0]}" = "" -o "${argument[1]}" = "" ] ; then
	echo "[info] Repository Log : n/a"
	exit 0
fi
echo "[info] Repository Revision(Last 2) :" "${argument[0]}" "${argument[1]}"
echo "[info] (After 5s Will Auto Exit)"
read -t 5 -p "Log(KDiff3) = Y/y Or Exit = Other) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [ "$checkans" = "Y" -o "$checkans" = "y" ] ; then
	echo "[info] Log(KDiff3)"
	hg qlog
	hg kdiff3 -r"${argument[0]}" -r"${argument[1]}"
else
	echo "[info] Exit"
fi
exit 0
