#!/bin/bash
DATE=$(date +"%Y.%m.%d")
fn=$(basename "$1")
fna=""${fn%.*}"("${DATE}").7z"
7z a "${fna}" "$1"
exit 0
