#!/bin/sh
$YUM -y    install php \
                  php-pecl-apc \
                  php-cli \
                  php-curl \
                  php-devel \
                  php-ldap \
                  php-mbstring \
                  php-mcrypt \
                  php-mysql \
                  php-pecl-memcache \
                  php-soap \
                  php-xml \
                  php-mcrypt

# ToDo: anything against installing Suhosin?

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini
sed -i 's/display_errors = Off/display_errors = On/g' /etc/php.ini

# httpd php.conf is handled by RPM
