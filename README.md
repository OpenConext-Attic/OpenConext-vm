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

Verify that Vagrant and VeeWee are setup correctly with the following commands (should not return an error):

    $ vagrant -v
    $ vagrant basebox templates

Then build a basebox (one time):

    $ vagrant basebox build -f demo.openconext.org &&
    $ vagrant basebox export demo.openconext.org &&
    $ vagrant box remove demo.openconext.org
    $ vagrant box add demo.openconext.org demo.openconext.org.box

Then instantiate the box:

    $ vagrant destroy
    $ vagrant up

Finally copy host/hosts to your [hosts file](http://en.wikipedia.org/wiki/Hosts_%28file%29)
and point your browser to <https://profile.demo.openconext.local>.