#!/bin/bash
find . -maxdepth 1 -regextype posix-extended -regex ".+\.(7z|bz2|exe|gz|msi|tgz|xpi|xz|zip)" -exec 7z t {} \; | grep -E '^Testing|^Everything' | awk '/^Testing/{i=$0 ; next ;}{print i " " $0 ;}' | sort
exit 0
