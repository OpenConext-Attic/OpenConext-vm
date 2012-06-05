yum -y -q install memcached

chkconfig memcached on && service memcached restart