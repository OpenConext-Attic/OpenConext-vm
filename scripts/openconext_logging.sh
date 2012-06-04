# Remove earlier installation files
rm -rf /var/log/surfconext/

mkdir -p /var/log/surfconext
chmod o+w /var/log/surfconext
touch /var/log/surfconext/engineblock.log
chmod o+w /var/log/surfconext/engineblock.log