#!/bin/bash

echo "Installing MYSQL server"
$YUM -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# configure MySQL
echo -e "\n\nSetting new MySQL Root password \n\n"
mysqladmin -u root password $OC__ROOT_DB_PASS

success=`mysqladmin -uroot -p$OC__ROOT_DB_PASS ping | grep -c "mysqld is alive"`
if [[ $success == '1' ]]
then
    echo -e "\nValidating MySQL Root password: SUCCESS!\n"
else
    echo -e "\nValidating MySQL Root password: FAILED\n"
    exit
fi

echo -e "Enabling root access on db.$OC_DOMAIN"
echo "GRANT ALL ON *.* TO 'root'@'db.$OC_DOMAIN' IDENTIFIED BY '$OC__ROOT_DB_PASS' WITH GRANT OPTION;" \
  | myql -u root -p$OC__ROOT_DB_PASS