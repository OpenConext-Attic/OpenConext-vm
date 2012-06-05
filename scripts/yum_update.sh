# update the CentOS/RHEL system
yum -y -q update

# TODO sometimes this upgrades the kernel, facilitating the need for rebuilding
# the guest additions
# sudo /etc/init.d/vboxadd setup