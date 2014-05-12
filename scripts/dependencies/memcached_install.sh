#!/bin/bash
$YUM -y install memcached

chkconfig memcached on
if service memcached status > /dev/null
then
  service memcached stop
  sleep 5
fi
service memcached start