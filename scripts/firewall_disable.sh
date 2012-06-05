#!/bin/sh
# Disable firewall
chkconfig iptables  off && service iptables stop
chkconfig ip6tables off && service ip6tables stop