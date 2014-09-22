#!/bin/bash

#for some packages (like php extension mcrypt) we need the extra repo
#from Redhat Enterprise Linux
if [[ `rpm -qi epel-release-6-8 | grep 'not installed'` ]]
then
  echo "install additional RHEL repository"
  curl -o /tmp/epel-release-6-8.noarch.rpm http://ftp.nluug.nl/pub/os/Linux/distr/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
  yum install -y /tmp/epel-release-6-8.noarch.rpm
  rm /tmp/epel-release-6-8.noarch.rpm
else
  echo "RHEL repository already installed"
fi

$YUM -y install git subversion policycoreutils-python sudo unzip wget

if [[ $UPDATE_OS ]]
then
  $YUM -y update
fi
