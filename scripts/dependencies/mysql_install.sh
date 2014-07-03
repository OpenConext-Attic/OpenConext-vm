#!/bin/bash

echo "Installing MYSQL server"
$YUM -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# Root PW already set?
success=`mysqladmin -uroot -p$OC__ROOT_DB_PASS ping | grep -c "mysqld is alive"`
if [[ $success != '1' ]]
then
    # If not then try to connect without a password and set it
    echo -e "\n\nSetting new MySQL Root password \n\n"
    mysqladmin -u root password $OC__ROOT_DB_PASS
fi

# Test connection with proper root password.
success=`mysqladmin -uroot -p$OC__ROOT_DB_PASS ping | grep -c "mysqld is alive"`
if [[ $success == '1' ]]
then
    echo -e "\nValidating MySQL Root password: SUCCESS!\n"
else
    echo -e "\nValidating MySQL Root password: FAILED\n"
    exit
fi
