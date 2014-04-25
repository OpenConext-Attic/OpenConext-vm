#!/bin/sh

if [[ `rpm -qi mysql-server | grep 'not installed'` ]]
then
  echo "Installing MYSQL server"
  $YUM -y install mysql mysql-server mysql-connector-java

  service mysqld restart
  chkconfig mysqld on

  # configure MySQL
  echo -e "\n\nSetting new MySQL Root password \n\n"
  mysqladmin -u root password $OC__ROOT_DB_PASS
  #echo "grant all privileges on *.* to 'root'@'localhost' identified by '$OC__ROOT_DB_PASS';" | mysql -u root --password=$OC__ROOT_DB_PASS mysql
fi

success=`mysqladmin -uroot -p$OC__ROOT_DB_PASS ping | grep -c "mysqld is alive"`
if [[ $success == '1' ]]
then
        echo -e "\nValidating MySQL Root password: SUCCESS!\n"
else
	echo -e "\nValidating MySQL Root password: FAILED\n"
	exit
fi
