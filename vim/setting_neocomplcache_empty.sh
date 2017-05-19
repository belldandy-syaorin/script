#!/bin/bash
if [ -d ~/.cache/neocomplcache ] ; then
	rm -r ~/.cache/neocomplcache
	echo "[ ok ] Find neocomplcache & Remove"
else
	echo "[info] Can't Find neocomplcache & Exit"
fi
exit 0
