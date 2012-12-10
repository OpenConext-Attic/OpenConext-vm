# OpenConext Virtual Machine

These are the resources required to build an OpenConext Virtual Machine.

OpenConext is the completely Open Source version of the educational collaboration platform that is used in the Netherlands, SURFconext.
For more information regarding OpenConext, refer to the documentation at [http://www.openconext.org](http://www.openconext.org)

# How to use this OpenConext VM?

You can either use a VM instance you created yourself (read on), or use [our complete procedure to create one](https://github.com/OpenConext/OpenConext-vm/wiki/Vagrant-and-Veewee).

# Bring your own VM instance
Prerequisites: a VM running CentOS 6 or RedHat EL 6.

## 1. Clone
From within the VM, download this repo:

    curl https://nodeload.github.com/OpenConext/OpenConext-vm/tar.gz/master | tar zx


## 2. Run the installer
Run the install script:

    bash OpenConext-vm-master/scripts/install_openconext.sh

By default, the installer will run an 'unattended' setup, choosing sensible defaults.
If you want to install a specific version of the platform, install a subset of components or change the default domain (demo.openconext.org), run the installer with a ````-i```` flag:

    bash OpenConext-vm-master/scripts/install_openconext.sh -i

## 3. Change your hosts-file
The installer ends with a message suggesting to add an entry to your hosts-file (that is: of the VM-host).
Follow this suggestion if you want to use the OpenConext service from outside of the VM..

## 4. Visit Welcome URL
Point your browser to the welcome-URL, as mentioned by the installer.
_Install the CA's certificate in your browser_ as mentioned on that page.


## Platform usage

You can now use the following OpenConext components:

* [OpenConext Profile](https://profile.demo.openconext.org)
* [OpenConext Manage](https://manage.demo.openconext.org)
* [OpenConext ServiceRegistry](https://serviceregistry.demo.openconext.org)
* [OpenConext Teams](https://teams.demo.openconext.org)
* [OpenConext Api](https://api.demo.openconext.org/v1/test)
* [OpenConext Mujina-SP](https://mujina-sp.demo.openconext.org)

To login in on the several Service Providers you can choose OpenConext Mujina IdP from the WAYF and login with ``admin`` / ``secret``.

### Samba share
If you want to make modifications to the components a Samba share is available at:

    smb://172.18.5.2/www
    username: openconext
    password: openconext

### MySQL access
If you want to query or update the database you will have to open up port 3306. Type in a VM shell:

    iptables -I INPUT -p tcp -m tcp  --dport 3306 -j ACCEPT

The MySQL root-password is ``c0n3xt``.
