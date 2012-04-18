#!/bin/sh

#
# System Configuration
#
# This script configures a CentOS system for OpenConext. It performs system 
# configuration to prepare for OpenConext installation. It does not install or
# modify any of the OpenConext software yet.
#

# Check SELinux
sestatus | grep "SELinux status" | grep "enabled" > /dev/null
if [ $? -eq 0 ]
then
	sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/g' /etc/selinux/config
        echo "SELinux currently ENABLED. We disabled it for you now, PLEASE REBOOT FIRST and run this script again."
	exit 1
fi

# update the CentOS/RHEL system
yum -y update

# install OS provided required packages for OpenConext
yum -y install tomcat6 httpd php-cli php php-mysql php-curl svn telnet \
	mod_ssl mysql-server openldap-servers php-ldap php-xml wget \
	firefox mysql-connector-java memcached openldap-clients \
	php-pecl-memcache nss-tools gcc kernel-devel git \
	java-1.6.0-openjdk-devel ant php-devel nano openssh-server

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini

# Set some services to start on system boot or *not* start on boot
chkconfig httpd on
chkconfig mysqld on
chkconfig memcached on
chkconfig sshd on
chkconfig iptables off
chkconfig ip6tables off

# configure some OpenConext DNS entries on this machine
grep openconext /etc/hosts > /dev/null
if [ $? -eq 1 ]
then
	# add DNS entries to hosts file
	echo "# OpenConext" >> /etc/hosts
	echo "127.5.0.10  db.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.20  ldap.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.30  grouper.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.40  serviceregistry.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.50  engine.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.60  manage.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.70  guestidp.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.80  portal.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.90  teams.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.100 os.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.110 testsp.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.120 static.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.130 testidp.demo.openconext.org" >> /etc/hosts
fi

# configure system browser to point to service registry by default
echo 'pref("browser.startup.homepage", "data:text/plain,browser.startup.homepage=https://serviceregistry.demo.openconext.org");' > /usr/lib64/firefox/defaults/preferences/localprefs.js



