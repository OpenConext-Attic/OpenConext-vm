##########################
# Install Static content #
##########################
mkdir -p /opt/www/ &&
cd /opt/www/ &&
git clone git://github.com/OpenConext/OpenConext-static.git
ln -s OpenConext-static static
cd -