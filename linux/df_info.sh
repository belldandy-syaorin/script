#!/bin/bash
if [ ! -d "$1" ] ; then
	echo "[info] Not Directory & Exit"
	exit 0
fi
echo "[info] Target Directory :" "$1"
echo "[info] Total            :" $(ls -A1 "$1" | wc -l)
echo "[info] Directory        :" $(ls -Al "$1" | grep '^d' | wc -l)
echo "[info] File             :" $(ls -Al "$1" | grep '^-' | wc -l)
echo "[info] Link             :" $(ls -Al "$1" | grep '^l' | wc -l)
exit 0
