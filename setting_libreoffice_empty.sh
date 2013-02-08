#!/bin/bash
if [ -f ~/.config/libreoffice/4/user/registrymodifications.xcu ] ; then
	rm ~/.config/libreoffice/4/user/registrymodifications.xcu
	echo "[ ok ] Find registrymodifications.xcu & Remove"
else
	echo "[info] Can't Find registrymodifications.xcu & Exit"
fi
exit 0
