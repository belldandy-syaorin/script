#!/bin/bash
if [ ! -d "$1" ] ; then
	echo "[info] Not Directory & Exit"
	exit 0
else
	fl=$(ls -Al "$1")
fi
echo "[info] Target Directory :" "$1"
echo "[info] Directory        :" $(echo "${fl[@]}" | grep '^d' | wc -l)
echo "[info] File             :" $(echo "${fl[@]}" | grep '^-' | wc -l)
echo "[info] Link             :" $(echo "${fl[@]}" | grep '^l' | wc -l)
exit 0
