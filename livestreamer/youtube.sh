#!/bin/bash
livestreamer $(echo "$1"|sed 's/www.youtube.com/youtu.be/'|sed 's/watch?v\=//'|sed 's/&.*$//') best
exit 0
