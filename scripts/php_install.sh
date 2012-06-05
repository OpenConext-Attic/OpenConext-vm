#!/bin/sh
yum -y -q install php php-cli php-mysql php-curl php-ldap php-xml php-pecl-memcache php-devel

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini