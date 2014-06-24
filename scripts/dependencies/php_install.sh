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

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini
sed -i 's/display_errors = Off/display_errors = On/g' /etc/php.ini

# Note that if you do anything in PHP with dates or times then PHP needs to know the timezone it should use.
# Here we default to Amsterdam (because that is where development happens).
sed -i 's/;date.timezone =/date.timezone = Europe\/Amsterdam/g' /etc/php.ini

# Because we have more than 64MB of code we need to increase the shared memory size for APC.
# Otherwise we will get the PHP Warning: include(): Unable to allocate memory for pool.
sed -i 's/apc.shm_size=64M/apc.shm_size=128M/g' /etc/php.d/apc.ini

# httpd php.conf is handled by RPM