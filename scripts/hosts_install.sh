# configure some OpenConext DNS entries on this machine
grep openconext /etc/hosts > /dev/null
if [ $? -eq 1 ]
then
	# add DNS entries to hosts file
	echo "# OpenConext" >> /etc/hosts
	echo "127.5.0.1  db.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.2  ldap.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.3  grouper.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.4  serviceregistry.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.5  engine.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.6  manage.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.7  guestidp.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.8  portal.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.9  teams.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.10 os.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.11 testsp.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.12 static.demo.openconext.org" >> /etc/hosts
	echo "127.5.0.13 testidp.demo.openconext.org" >> /etc/hosts
fi