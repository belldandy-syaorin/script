#!/bin/bash
declare -a argument
	argument[0]="$(hg log --limit 2|grep changeset:)"
	argument[1]="$(echo "${argument[0]}"|awk NR==1'{printf "%s\n",$2}')"
	argument[2]="$(echo "${argument[0]}"|awk NR==2'{printf "%s\n",$2}')"
if [ -z "${argument[0]}" -o -z "${argument[1]}" ] ; then
	echo "[info] Repository Log : n/a"
	exit 0
fi
echo "[info] Repository Log(Last 2)"
hg log --graph --limit 2 --stat
echo "[info] Diff Repository Changeset(Last 2) :" "${argument[1]}" "${argument[2]}"
echo "[info] K/k = KDiff3"
echo "[info] V/v = VIM"
read -t 5 -p "[info] No Input = Exit (After 5s Will Auto Exit) : " ans
checkans=$(echo "${ans:0:1}"|grep '^[[:alpha:]]')
if [[ "$checkans" =~ [kK] ]] ; then
	echo "[info] KDiff3"
	hg kdiff3 -r"${argument[1]}" -r"${argument[2]}"
elif [[ "$checkans" =~ [vV] ]] ; then
	echo "[info] VIM"
	hg vimdiff -r"${argument[1]}" -r"${argument[2]}"
else
	echo "Exit (Auto)"
	echo "[info] Exit"
fi
exit 0
