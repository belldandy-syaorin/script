#!/bin/bash
for dirs in $@
do
	if [ ! -d "$dirs" ] ; then
		echo "[info] Not Directory & Exit"
		exit 0
	else
		fl=$(ls -Al "$dirs")
	fi
	echo "[info] Target Directory :" "$dirs"
	echo "[info] Directory        :" $(echo "${fl[@]}" | grep '^d' | wc -l)
	echo "[info] File             :" $(echo "${fl[@]}" | grep '^-' | wc -l)
	echo "[info] Link             :" $(echo "${fl[@]}" | grep '^l' | wc -l)
done
exit 0
