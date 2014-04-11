#!/bin/bash

#for some packages (like php extension mcrypt) we need the extra repo
#from Redhat Enterprise Linux
if [[ `rpm -qi epel-release-6-8 | grep 'not installed'` ]]
then
  echo "install additional RHEL epel repository"
  curl -o /tmp/epel-release-6-8.noarch.rpm http://epel.mirror.net.in/epel/6/i386/epel-release-6-8.noarch.rpm
  rpm -Uvh /tmp/epel-release-6-8.noarch.rpm
  rm /tmp/epel-release-6-8.noarch.rpm
else
  echo "RHEL epel repository already installed"
fi

if [[$UPDATE_OS == "TRUE"]]
then
$YUM -y update
fi
