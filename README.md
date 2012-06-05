# OpenConext Virtual Machine

These are the source files to build an OpenConext Virtual Machine.

# Requirements (in order)

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://vagrantup.com/)
* [VeeWee](https://github.com/jedi4ever/veewee)
* Patience (a full build, depending on your network connection, should take about 4 hours)

# Installation

    $ git clone git://github.com/OpenConext/OpenConext-vm.git
    $ cd OpenConext-vm
    $ sudo echo host/hosts >> /etc/hosts
    $ ./osx_install.sh
