#!/bin/bash
CHECKS=(ED2KSUMS MD5SUMS SHA1SUMS SHA256SUMS SHA512SUMS)
for checks in ${CHECKS[@]}
do
	if [ -f ./$checks ] ; then
		rhash --check --percents $checks
	fi
done
exit 0
