#!/bin/bash
declare -a argument
	argument[0]="$(hg status)"
if [ "${argument[0]}" = "" ] ; then
	echo "[info] Repository Status : n/a"
	exit 0
fi
argument[1]="$(echo ${argument[0]}|sed -e 's/A\ /add\ /g' -e 's/M\ /mod\ /g' -e 's/R\ /remove\ /g')"
echo "[info] Repository Status :" ${argument[0]}
echo "[info] Commit Message    :" ${argument[1]}
echo "[info] Commit = Y/y Or"
read -t 5 -p "[info] Exit = Other (After 5s Will Auto Exit ,Default) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [[ "$checkans" =~ [yY] ]] ; then
	echo "[info] Commit"
	hg commit -m "${argument[1]}"
else
	echo "[info] Exit"
fi
exit 0
