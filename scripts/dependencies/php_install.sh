#!/bin/bash
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

# Set default timezone
echo "Setting default timezone for PHP to $OC__TIMEZONE"
sed -i /etc/php.ini -e "s~^date.timezone =.*~date.timezone = $OC__TIMEZONE~"

# Because we have more than 64MB of code we need to increase the shared memory size for APC.
# Otherwise we will get the PHP Warning: include(): Unable to allocate memory for pool.
sed -i 's/apc.shm_size=64M/apc.shm_size=128M/g' /etc/php.d/apc.ini

# httpd php.conf is handled by RPM
