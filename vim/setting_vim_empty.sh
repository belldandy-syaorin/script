#!/bin/bash
if [ -f ~/.viminfo ] ; then
	rm ~/.viminfo
	echo "[ ok ] Find .viminfo & Remove"
else
	echo "[info] Can't Find .viminfo & Exit"
fi
exit 0
