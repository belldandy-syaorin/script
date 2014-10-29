#!/bin/bash
declare -a argument
	argument[0]="$(hg status)"
	argument[1]="$(hg status|grep ^M|sed 's/^M/mod/g')"
if [ "${argument[0]}" = "" ] ; then
	echo "[info] Repository Status : n/a"
	exit 0
fi
if [ "${argument[1]}" = "" ] ; then
	echo "[info] Modified : n/a"
	exit 0
fi
echo "[info] Repository Status :" "${argument[0]}"
echo "[info] Commit Message    :" "${argument[1]}"
echo "[info] (After 5s Will Auto Exit)"
read -t 5 -p "Commit = Y/y Or Exit = Other) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [ "$checkans" = "Y" -o "$checkans" = "y" ] ; then
	hg commit -m "${argument[1]}"
	echo "[info] Commit"
else
	echo "[info] Exit"
fi
exit 0
