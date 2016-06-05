#!/bin/bash
echo "[info] smartctl --info $1"
sudo smartctl --info $1
echo "[info] smartctl --health $1"
sudo smartctl --health $1
echo "[info] smartctl --attributes $1 | grep -E 'Rate|Reallocated|Temperature'"
sudo smartctl --attributes $1 | grep -E 'Rate|Reallocated|Temperature'
exit 0
