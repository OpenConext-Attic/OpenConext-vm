##########################
# Install Static content #
##########################

if [ ! -h /opt/www/static ];
then
    cd /opt/www &&
    git clone git://github.com/OpenConext/OpenConext-static.git
    ln -sf OpenConext-static static
    cd -
fi