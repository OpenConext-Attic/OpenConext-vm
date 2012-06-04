yum -y install mysql mysql-server mysql-connector-java

service mysqld restart
chkconfig mysqld on

# configure MySQL (WARNING: this is insecure!)
mysqladmin -u root password 'c0n3xt'
echo "grant all privileges on *.* to 'root'@'%' identified by 'c0n3xt';" | mysql -u root --password=c0n3xt mysql