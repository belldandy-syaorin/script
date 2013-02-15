#!/bin/bash
if [ -d ~/.neocon ] ; then
	rm -r ~/.neocon
	echo "[ ok ] Find .neocon & Remove"
else
	echo "[info] Can't Find .neocon & Exit"
fi
exit 0
