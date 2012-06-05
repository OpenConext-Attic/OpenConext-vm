#!/bin/sh
# Check SELinux
sestatus | grep "SELinux status" | grep "enabled" > /dev/null
if [ $? -eq 0 ]
then
	sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/g' /etc/selinux/config
        echo "SELinux was enabled. We disabled it for you now, PLEASE REBOOT and run this script again!"
	exit 1
fi