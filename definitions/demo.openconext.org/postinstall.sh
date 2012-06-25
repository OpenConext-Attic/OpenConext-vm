#!/bin/sh
#http://chrisadams.me.uk/2010/05/10/setting-up-a-centos-base-box-for-development-and-testing-with-vagrant/

date > /etc/vagrant_box_build_time

yum -y install \
        gcc make gcc-c++ \
        ruby \
        kernel-devel-`uname -r` \
        zlib-devel openssl-devel readline-devel sqlite-devel mysql-devel \
        perl

cat > /etc/yum.repos.d/puppetlabs.repo << EOM
[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
enabled=1
gpgcheck=0
EOM

cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

yum -y install puppet facter ruby-devel rubygems
yum -y clean all
rm /etc/yum.repos.d/{puppetlabs,epel}.repo

gem install --no-ri --no-rdoc chef

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
curl -L -o authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chown -R vagrant /home/vagrant/.ssh

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
curl -L -o VBoxGuestAdditions_$VBOX_VERSION.iso http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm VBoxGuestAdditions_$VBOX_VERSION.iso

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

dd if=/dev/zero of=/tmp/clean || rm /tmp/clean

# Installing Java
yum -q list jdk
if [ $? -ne 0 ]
then
    cd /root
    yum -y install java-1.6.0-openjdk-devel
    echo "Downloading http://files.sumix.com/java/j2se_1.6.0_32/jdk-6u32-linux-x64-rpm.bin..."
    yum -y install wget
    wget -N -nv http://files.sumix.com/java/j2se_1.6.0_32/jdk-6u32-linux-x64-rpm.bin
    sh jdk-6u32-linux-x64-rpm.bin -noregister
    rm -vf jdk-6u32-linux-x64-rpm.bin
    rm -vf jdk*.rpm
    rm -vf sun-javadb*.rpm
    cd /etc/alternatives
    rm -vf java
    ln -s /usr/java/latest/bin/java
    rm -vf javac
    ln -s /usr/java/latest/bin/javac
    cd -
fi

# Yum utils

yum -y -q install svn \
    git \
    telnet \
	wget \
	nss-tools \
	gcc \
	kernel-devel \
	ant \
	nano \
	mlocate

updatedb

# Disable SE linux

sestatus | grep "SELinux status" | grep "enabled" > /dev/null
if [ $? -eq 0 ]
then
	sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/g' /etc/selinux/config
        echo "SELinux was enabled. We disabled it for you now, PLEASE REBOOT and run this script again!"
	exit 1
fi

exit
