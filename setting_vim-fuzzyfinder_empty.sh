#!/bin/bash
if [ -d ~/.vim-fuf-data ] ; then
	rm -r ~/.vim-fuf-data
	echo "[ ok ] Find .vim-fuf-data & Remove"
else
	echo "[info] Can't Find .vim-fuf-data & Exit"
fi
exit 0
