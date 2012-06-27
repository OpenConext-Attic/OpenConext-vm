# OpenConext Virtual Machine

These are the source files to build an OpenConext Virtual Machine.

# Requirements for building the OpenConext VM (in order)

* The **latest** version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [RVM](https://rvm.io/)
* [Ruby](http://www.ruby-lang.org/en/)
* Patience (a full build, depending on your network connection, should take about 4 hours)

# Installation

First install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) if you have not done already.
Make sure you use the latest version. 

The OpenConext Virtual Machines scripts uses [Vagrant](http://vagrantup.com/) and [VeeWee](https://github.com/jedi4ever/veewee) for building up the VM. You don't have to install these dependencies as we use [Bundler](http://gembundler.com/) to install gems in the local gemset (to avoid polluting your global applications and/ or gemset).

To use Ruby and use local gemsets we first need to install [RVM](https://rvm.io//rvm/install/) using:

    $ curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable

Make sure to restart your terminal, or session in order to add the directory of the
`rvm` command to your PATH. 

Due to an incompatibility with the default openssl installation on mac-os it might be necessary to (re)compile ruby with a different openssl. See for more information:

    http://blog.55minutes.com/2012/01/fixing-a-segmentation-fault-in-ruby-193/

Now we can install the latests Ruby version (*NOTE* if you are on mac-os you will have to use the second command) : 

    $ rvm install 1.9.3 

Or

    $ rvm install 1.9.3 --with-openssl-dir=/opt/local --with-iconv-dir=/opt/local


And set the 1.9.3 version to the default (not strictly necessary)

    $ rvm --default use 1.9.3

Please note that RVM uses bash profile to load itself in your shell.
Thus, RVM doesn't load when you use another shell or don't login to your shell.
In gnome-terminal on Ubuntu you can enable login by: Edit > Profile preferences > Run command as a login shell.

Verify the correct installation by typing:

    $ ruby -v

You should see:

    ruby 1.9.3p0 (2011-10-30 revision 33570) [x86_64-darwin10.8.0]

Now get the source code of the  OpenConext VM:

    $ git clone git://github.com/OpenConext/OpenConext-vm.git
    $ cd OpenConext-vm
    
Now you are prompted to accept the OpenConext .rvmrc file:

    RVM has encountered a new or modified .rvmrc file in the current directory =
    This is a shell script and therefore may contain any shell commands.       =

    Examine the contents of this file carefully to be sure the contents are    =
    safe before trusting it! ( Choose v[iew] below to view the contents )      =

    Do you wish to trust this .rvmrc file? (/path/OpenConext-vm/.rvmrc)
    y[es], n[o], v[iew], c[ancel]>

Accept the .rmvrc file by typing **y**

Now install bundler as local gem:

    $ gem install bundler

And use the gems defined in the Gemfile to install vagrant and veewee:

    $ bundle install

Verify that Vagrant and VeeWee are setup correctly with the following commands (should not return an error):

    $ vagrant -v
    $ vagrant basebox templates

Then build a basebox (one time):

    $ vagrant basebox build -f demo.openconext.org 
    $ vagrant basebox export demo.openconext.org
    $ vagrant box remove demo.openconext.org
    $ vagrant box add demo.openconext.org demo.openconext.org.box

The third command is necessary to clean up previous boxes. If this is the first time you can ignore the following:

    $ Box 'demo.openconext.org' could not be found

Then instantiate the box:

    $ vagrant destroy
    $ vagrant up

Finally copy host/hosts to your [hosts file](http://en.wikipedia.org/wiki/Hosts_%28file%29)
and point your browser to <https://profile.demo.openconext.org>.

If you want to avoid having to add the ssl exceptions in your browser you can import the Certificate Authority certificate:

    OpenConext-vm/certs/openconext.pem 

into your browser.

To login in on the several Service Providers you can choose OpenConext Mujina IdP from the WAYF and login with admin, secret.

# Platform usage

You can now use the following OpenConext components:

* [OpenConext Profile](https://profile.demo.openconext.org)
* [OpenConext Manage](https://manage.demo.openconext.org)
* [OpenConext ServiceRegistry](https://serviceregistry.demo.openconext.org)
* [OpenConext Teams](https://teams.demo.openconext.org)
* [OpenConext Api](https://api.demo.openconext.org/v1/test)
* [OpenConext Mujina-SP](https://mujina-sp.demo.openconext.org)

If you want to make modifications to the components a Samba share is available at:

    smb://172.18.5.2/www
    username: openconext
    password: openconext
    
If you want to query or update the database, you can connect to it either from the prompt:

    $ vagrant ssh
    $ mysql -u root -p
    Enter password: c0n3xt

Or use the host DNS entry demo.openconext.org and default port 3306.
    
# VM usage

We use [Vagrant](http://vagrantup.com/) to manage the VM sp please refer to the [their documentation](http://vagrantup.com/v1/docs/commands.html) for an quick overview of the available commands, or type

    $ vagrant     