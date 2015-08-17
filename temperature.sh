#!/bin/bash
sensors | grep ^Core
sensors | grep ^fan
sudo smartctl -a /dev/sda | grep -i temp
sudo smartctl -a /dev/sdb | grep -i temp
sudo smartctl -H /dev/sda | grep ^SMART
sudo smartctl -H /dev/sdb | grep ^SMART
exit 0
