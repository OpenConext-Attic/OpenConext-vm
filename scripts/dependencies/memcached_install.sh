#!/bin/sh
$YUM -y install memcached

chkconfig memcached on && service memcached restart