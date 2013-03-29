#!/bin/bash
if [ -d ~/.neocomplcache ] ; then
	rm -r ~/.neocomplcache
	echo "[ ok ] Find .neocomplcache & Remove"
else
	echo "[info] Can't Find .neocomplcache & Exit"
fi
exit 0
