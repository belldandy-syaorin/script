#!/bin/bash
find . -regextype posix-extended -regex ".+\.(7z|bz2|exe|gz|msi|tgz|xz|zip)" -exec 7z t {} \; | grep -E '^Testing|^Everything' | xargs -n 6
exit 0
