#######################
# Install EngineBlock #
#######################
mkdir -p /opt/www/ &&
cd /opt/www/ &&
git clone git://github.com/OpenConext/OpenConext-engineblock.git
ln -s OpenConext-engineblock engine &&
echo "create database engineblock default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
cd -