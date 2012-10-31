# OpenConext Virtual Machine

These are the source files to build an OpenConext Virtual Machine. We do not make assumptions on how you create the actual VM, but we do provide a way to build a VM using VirtualBox, VeeWee and Vagrant. Note that you are not forced to build the initial VM like this. 

# Requirements for building the initial VM (in order) with Vagrant and Veewee

Please do not start installing the software. There are step-by-step guides in the next sections.

* The **latest** version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [rbenv](https://github.com/sstephenson/rbenv)
* [Git](http://http://git-scm.com/)
* Patience (a full build, depending on your network connection, should take about 1 hour)

# Requirements for installing the OpenConext software on your VM

* [Git](http://http://git-scm.com/)

# Requirements on Debian/Ubuntu
Install Virtualbox, see: https://www.virtualbox.org/wiki/Linux_Downloads
Install required packages:

    $ sudo apt-get install git libssl-dev libopenssl-ruby zlib zlib1g-dev

# Installation (Note that this is only necessary if you don't already have a CentOS-6+ VM)

First install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) if you have not done already.
Make sure you use the latest version. 

The OpenConext Virtual Machines scripts uses [Ruby](http://www.ruby-lang.org/en/), [Vagrant](http://vagrantup.com/) and [VeeWee](https://github.com/jedi4ever/veewee) for building up the VM. 
You don't have to install these dependencies as we use [Bundler](http://gembundler.com/) to install these.

To use Ruby and use gemsets we first need to install [rbenv](https://github.com/sstephenson/rbenv#section_2). The instructions on the github page are simple to follow. We also make use of the following plugins for rbenv to manage ruby versions and the gems:

* [rbenv Ruby Build Plugin](https://github.com/sstephenson/ruby-build)    
* [rbenv Bundler Plugin](https://github.com/carsomyr/rbenv-bundler)    

With the two plugins installed (and of course rbenv) you can simply tell rbenv to install the version of ruby we use:

    $ rbenv install 1.9.3-p286
    $ rbenv rehash

Verify the correct installation by typing:

    $ rbenv versions

You should see (at least):

* 1.9.3-p286

Now get the source code of the  OpenConext VM:

    $ git clone git://github.com/OpenConext/OpenConext-vm.git
    $ cd OpenConext-vm
    
	Now install bundler as gem in your ruby version (managed by rbenv):

    $ gem install bundler

Next use the gems defined in the Gemfile to install vagrant and veewee:

    $ bundle install

Verify that Vagrant and VeeWee are setup correctly with the following commands (should not return an error):

    $ vagrant -v
    $ vagrant basebox templates

Then build a basebox (one time):

    $ vagrant basebox build -f demo.openconext.org 
    
Make sure you answer **Yes** and not **Y** when asked to download the box file. Please let all the commands run untill your prompt is back (e.g. don't go start typing in the pop-ups of the VM)
    
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
    
# SSH & SCP

To connect to the VM with ssh or copy files with scp you can inspect the ssh settings with:

    $ vagrant ssh-config
    
which will print the ssh configuration used with **vagrant ssh**:

    Host default
    HostName 127.0.0.1
    User vagrant
    Port 2222
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile /Users/user/.vagrant.d/insecure_private_key
    IdentitiesOnly yes
	
You can (as an alternative to ssh vagrant) use this information to ssh or scp (mind to replace the key file with the path of the vagrant ssh-config setting):

    ssh -i /Users/user/.vagrant.d/insecure_private_key vagrant@localhost -p 2222
    scp -P 2222 -i /Users/user/.vagrant.d/insecure_private_key some_local_file vagrant@localhost:

If you add the output of vagrant ssh-config to your ~/.ssh/config file you can ease the copying of files or connecting to the VM:

    ssh default
    scp some-local-file default:

As an alternative you change the samba share configured in OpenConext-vm/scripts/samba_install.sh.


# Using rbenv instead of RVM
(todo: move this part)

on Linux, make sure libxslt-dev and libxml2-dev are installed

    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone -- git://github.com/carsomyr/rbenv-bundler.git ~/.rbenv/plugins/bundler

Add the rbenv-config to your shell profile

    PATH=$PATH:~/.rbenv/bin
    eval "$(rbenv init -)"

Install Ruby

    rbenv install 1.9.3-p194

Go to OpenConext-vm clone, install required gems using bundler.

    bundle install