#!/bin/sh
# install required packages
yum -y -q install svn \
    git \
    telnet \
	wget \
	nss-tools \
	gcc \
	kernel-devel \
	ant \
	nano \
	mlocate &&

updatedb &