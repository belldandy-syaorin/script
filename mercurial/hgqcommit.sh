#!/bin/bash
declare -a argument
	argument[0]="$(hg status)"
if [ -z "${argument[0]}" ] ; then
	echo "[info] Repository Status : n/a"
	exit 0
fi
argument[1]="$(echo ${argument[0]}|sed -e 's/A\ /add\ /g;s/M\ /mod\ /g;s/R\ /remove\ /g')"
echo "[info] Repository Status :" ${argument[0]}
echo "[info] Commit Message    :" ${argument[1]}
echo "[info] Commit = Y/y Or"
read -t 5 -p "[info] No Input = Exit (After 5s Will Auto Exit) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [[ "$checkans" =~ [yY] ]] ; then
	echo "[info] Commit"
	hg commit -m "${argument[1]}"
else
	echo "Exit (Auto)"
	echo "[info] Exit"
fi
exit 0
