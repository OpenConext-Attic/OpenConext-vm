#!/bin/bash

echo "Installing MYSQL server"
$YUM -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# Root PW already set? Ignore any errors on this one.
set +e
success=`mysqladmin -uroot -p$OC__ROOT_DB_PASS ping | grep -c "mysqld is alive"`
set -e

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

# Make MySQL accept root@db.domain
# Note that for this to work from outside:
# 1. Port has to be open.
# 2. MySQL Server should not have been configured with a 'bind_address'.
# Though for a normal VM keeping it open for local use should be sufficient.
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'db.$OC_DOMAIN' identified by '$OC__ROOT_DB_PASS';" | mysql -u root --password=$OC__ROOT_DB_PASS mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'$OC_DOMAIN' identified by '$OC__ROOT_DB_PASS';" | mysql -u root --password=$OC__ROOT_DB_PASS mysql