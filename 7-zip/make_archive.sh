#!/bin/bash
DATE=$(date +"%Y.%m.%d")
DATETIME=$(date +"%Y.%m.%d-%H%M")
fn=$(basename "$1")
fnad=""${fn%.*}"("${DATE}").7z"
fnadt=""${fn%.*}"("${DATETIME}").7z"
if [ ! -f "${fnad}" ] ; then
	7z a "${fnad}" "$1"
else
	7z a "${fnadt}" "$1"
fi
exit 0
