#!/bin/bash
if [ -z "$1" ] ; then
	find /etc -regextype posix-extended -regex ".+\.rpm(new|save)" 2> /dev/null
elif [ "$1" == "root" ] ; then
	find / -regextype posix-extended -regex ".+\.rpm(new|save)" 2> /dev/null
fi
exit 0
