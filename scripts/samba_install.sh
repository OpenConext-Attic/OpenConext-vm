#!/bin/sh

yum list installed | grep samba
if [ $? -ne 0 ]
then
    yum -y -q install samba

    cat >> /etc/samba/smb.conf << SMB
[www]
    comment = OpenConext /opt/www
    path = /opt/www
    public = yes
    writable = yes
    guest ok = yes
    browseable = yes
    read only = no
    create mask = 0644
    directory mask = 0755
    valid users = openconext
SMB

    useradd -c "OpenConext user" openconext
    (echo openconext; echo openconext) | smbpasswd -as openconext

    chown -Rf openconext /opt/www

    service smb restart
fi