#!/bin/bash
declare -a argument
	argument[0]="$(hg status)"
	argument[1]="$(echo "${argument[0]}"|awk NR==1'{printf "%s\n",$1}')"
	argument[2]="$(echo "${argument[0]}"|awk NR==2'{printf "%s\n",$1}')"
if [ "${argument[0]}" = "" ] ; then
	echo "[info] Repository Status : n/a"
	exit 0
fi
if [ "${argument[2]}" != "" ] ; then
	echo "[info] Added Or Modified : Multiple"
	exit 0
elif [ "${argument[1]}" = "A" ] ; then
	argument[3]="$(echo "${argument[0]}"|grep ^A|sed 's/^A/mod/g')"
elif [ "${argument[1]}" = "M" ] ; then
	argument[3]="$(echo "${argument[0]}"|grep ^M|sed 's/^M/mod/g')"
elif [ "${argument[1]}" = "" ] ; then
	echo "[info] Added Or Modified : n/a"
	exit 0
fi
echo "[info] Repository Status :" "${argument[0]}"
echo "[info] Commit Message    :" "${argument[3]}"
echo "[info] (After 5s Will Auto Exit)"
read -t 5 -p "Commit = Y/y Or Exit = Other) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [ "$checkans" = "Y" -o "$checkans" = "y" ] ; then
	echo "[info] Commit"
	hg commit -m "${argument[3]}"
else
	echo "[info] Exit"
fi
exit 0
