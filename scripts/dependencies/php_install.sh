#!/bin/sh
yum -y -q install php \
                  php-apc \
                  php-cli \
                  php-curl \
                  php-devel \
                  php-ldap \
                  php-mbstring \
                  php-mcrypt \
                  php-mysql \
                  php-pecl-memcache \
                  php-soap \
                  php-xml

# Enable PHP short open tag for non-conforming PHP code
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php.ini
sed -i 's/display_errors = Off/display_errors = On/g' /etc/php.ini

cat > /etc/httpd/conf.d/_php.conf <<EOF
<IfModule prefork.c>
  LoadModule php5_module modules/libphp5.so
</IfModule>
<IfModule worker.c>
  LoadModule php5_module modules/libphp5-zts.so
</IfModule>
AddHandler php5-script .php
AddType text/html .php
DirectoryIndex index.php
EOF