#!/bin/bash
sudo apt-get -y purge $(dpkg -l|grep ^rc|awk '{print $2}')
exit 0
