#!/bin/bash
if [ -L /usr/lib/mozilla/plugins/libflashplayer.so ] ; then
	echo "[info] Symbolic Link Exist & Exit"
else
	sudo ln -s /libflashplayer.so /usr/lib/mozilla/plugins
	echo "[ ok ] Symbolic Link Create Success"
fi
exit 0
