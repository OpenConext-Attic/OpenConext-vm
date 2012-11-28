#!/bin/bash


$YUM -y install git subversion policycoreutils-python ntp

# Sync clock with ntp server (vm's tend to have their clock lag behind)
chkconfig --level 235 ntpd on
service ntpd start