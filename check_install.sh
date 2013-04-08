#!/bin/bash
ls -al /usr/local/bin/ | grep "$(date "+%b %e")"
exit 0
