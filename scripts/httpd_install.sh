#!/bin/sh
yum -y -q install httpd mod_ssl &&
chkconfig httpd on &&
service httpd restart