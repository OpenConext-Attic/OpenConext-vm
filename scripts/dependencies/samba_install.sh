#!/bin/bash

if $YUM list installed | grep -q 'samba\.'
then
  if $YUM info samba > /dev/null
  then
      $YUM -y install samba

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

      if ! grep -q -E ^openconext: /etc/passwd
      then
        useradd -c "OpenConext user" openconext
      fi
      (echo openconext; echo openconext) | smbpasswd -as openconext

      chown -Rf openconext /opt/www

      chkconfig smb on &&
      service smb start
    else
      echo "No Samba package available, will skip it."
    fi
fi
