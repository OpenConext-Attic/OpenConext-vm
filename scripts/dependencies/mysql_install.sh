#!/bin/sh
$YUM -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# configure MySQL
echo -e "\n\nSetting new MySQL Root password \n\n"
mysqladmin -u root password $OC__ROOT_DB_PASS
#echo "grant all privileges on *.* to 'root'@'localhost' identified by '$OC__ROOT_DB_PASS';" | mysql -u root --password=$OC__ROOT_DB_PASS mysql

if ! mysqladmin -u root --password=$OC__ROOT_DB_PASS ping 2> /dev/null | grep -q "mysqld is alive"
then
        echo -e "\n\nSetting new MySQL Root password OK\n\n"     
else
	echo -e "\n\nSetting new MySQL Root password FAILED\n\n"
	exit
fi
