#!/bin/bash

if [[$SETUP_FIREWALL == "TRUE"]]
then

echo "Will change firewall rules to a restrictive set that only allows SSH, HTTP and HTTPS"
cat > /etc/sysconfig/iptables-openconext <<EOF
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
EOF

# ipv4
if [ -f /etc/sysconfig/iptables ]
then
  cp /etc/sysconfig/iptables /etc/sysconfig/iptables-before-openconext-install
fi
mv /etc/sysconfig/iptables-openconext /etc/sysconfig/iptables

cat > /etc/sysconfig/ip6tables-openconext <<EOF2
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p ipv6-icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp6-adm-prohibited
-A FORWARD -j REJECT --reject-with icmp6-adm-prohibited
COMMIT
EOF2

# ipv6
if [ -f /etc/sysconfig/ip6tables ]
then
  cp /etc/sysconfig/ip6tables /etc/sysconfig/ip6tables-before-openconext-install
fi
mv /etc/sysconfig/ip6tables-openconext /etc/sysconfig/ip6tables
	service iptables restart

else
	echo "Leaving firewall rules untouched. You will need to set the firewall to allows SSH, HTTP and HTTPS manually"	
fi
