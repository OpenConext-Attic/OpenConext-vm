#!/bin/sh
$YUM -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# configure MySQL (WARNING: this is insecure!)

if ! mysqladmin -u root --password=c0n3xt ping | grep -q "mysqld is alive"
then
	mysqladmin -u root password 'c0n3xt'
fi
echo "grant all privileges on *.* to 'root'@'%' identified by 'c0n3xt';" | mysql -u root --password=c0n3xt mysql
