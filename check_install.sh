#!/bin/bash
ls -al /usr/local/bin/ | grep "$(date|awk '{print $2 " " $3}')"
exit 0
