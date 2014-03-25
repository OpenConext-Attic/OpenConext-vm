#!/bin/sh
# Install and set up NTP

$YUM -y install ntp

# Sync clock with ntp server (vm's tend to have their clock lag behind)
echo "Set up NTP"
touch /etc/cron.daily/ntpdate
echo '#!/bin/sh' >> /etc/cron.daily/ntpdate
echo '/usr/sbin/ntpdate 0.europe.pool.ntp.org' >> /etc/cron.daily/ntpdate
chmod a+x /etc/cron.daily/ntpdate

chkconfig --level 235 ntpd on
service ntpd start


