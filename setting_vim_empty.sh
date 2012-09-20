#!/bin/bash
if [ -f ~/.viminfo ] ; then
	rm ~/.viminfo
	echo "[ ok ] Find _viminfo & Remove"
else
	echo "[info] Can't Find _viminfo & Exit"
fi
exit 0
