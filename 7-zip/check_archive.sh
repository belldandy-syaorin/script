#!/bin/bash
find . -maxdepth 1 -type f -regextype posix-extended -regex ".+\.(7z|bz2|exe|gz|iso|msi|tar|tgz|xpi|zip)" -exec 7z t {} \; | grep -E '^Testing|^Everything' | awk '/^Testing/{i=$0 ; j++ ; next ;}{print "[info] " i " " $0 ;}END{print "[info] Total : " j}' | sort
exit 0
