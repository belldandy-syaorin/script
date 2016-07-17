#!/bin/bash
find . -regextype posix-extended -regex ".+\.(7z|bz2|exe|gz|msi|xz|zip)" -exec 7z t {} \; | grep -E '^Testing|^Everything'
exit 0
