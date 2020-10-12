#!/bin/bash
declare -a argument
	argument[0]="$(hg status)"
if [ -z "${argument[0]}" ] ; then
	echo "[info] Repository Status : n/a"
	echo "[info] Exit"
	exit 0
fi
argument[1]="$(echo ${argument[0]}|sed -e 's/A\ /add\ /g;s/M\ /mod\ /g;s/R\ /remove\ /g')"
echo "[info] Repository Status :" ${argument[0]}
echo "[info] Commit Message    :" ${argument[1]}
echo "y = Commit (After 5s Will Auto Exit)"
read -t 5 -p "Select Feature (Not y or No Input = Exit) : " ans
case $ans in
	"y")
		echo "[info] Commit"
		hg commit -m "${argument[1]}"
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
