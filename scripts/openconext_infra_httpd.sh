cd /vagrant/www/ &&
svn co https://svn.surfnet.nl/svn/coin-os/coin-infra/trunk/coin-infra-dist/src/main/ infra

# Apache Configuration
rm -vf /etc/httpd/conf.d/* &&
cp -vf infra/httpd/conf.d/php/demo/* /etc/httpd/conf.d/ &&
cp -vf main/httpd/conf.d/java/demo/* /etc/httpd/conf.d/ &&

cd - &&

###########################
# Install SSL certificate #
###########################

# The certificates were generated using the XCA tool, the DB file is included
# as well as "openconext.xdb".

rm -rvf /etc/httpd/keys &&
mkdir -p /etc/httpd/keys/ &&
cp certs/star.demo.openconext.local.key /etc/httpd/keys/ &&
cp certs/star.demo.openconext.local.pem /etc/httpd/keys/ &&

cp certs/openconext.pem /etc/httpd/keys/star.openconext.local_cabundle.pem &&

service httpd restart