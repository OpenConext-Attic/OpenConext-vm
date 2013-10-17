# OpenConext Virtual Machine

These are the resources required to build an OpenConext Virtual Machine.

OpenConext is the completely Open Source version of the educational collaboration platform that is used in the Netherlands, SURFconext.
For more information regarding OpenConext, refer to the documentation at [http://www.openconext.org](http://www.openconext.org)

# How to use this OpenConext VM?

You can either use Vagrant and a VM instance (CentOS 6.4 basebox) graciously provided by the
U.S. National Renewable Energy Laboratory Developer Network or install OpenConext on your own VM.

# Option 1. Using Vagrant

Prerequisites:
* Recent version of [Vagrant](https://vagrantup.com)

## 1.1. Make a new directory for all OpenConext code

Example for OS X:
```bash
mkdir ~/Sites/OpenConext
cd ~/Sites/OpenConext
```

## 1.2. Download the VM project there
```bash
curl https://codeload.github.com/OpenConext/OpenConext-vm/tar.gz/master | tar zxv
```

You should now have a directory called OpenConext-vm-master, go there and run vagrant up.
```bash
cd OpenConext-vm-master && vagrant up
```

# Option 2. Bring your own VM instance
Prerequisites:
* a VM running CentOS 6 or RedHat EL 6.

## 2.1. Download installer
From within the VM, download this repo:

```bash
curl https://codeload.github.com/OpenConext/OpenConext-vm/tar.gz/master | tar zx
```

## 2.2. Run the installer
Run the install script:

```bash
bash OpenConext-vm-master/scripts/install_openconext.sh
```bash

By default, the installer will run an 'unattended' setup, choosing sensible defaults.
If you want to install a specific version of the platform, install a subset of components or change the default domain (demo.openconext.org), run the installer with a ````-i```` flag:

    bash OpenConext-vm-master/scripts/install_openconext.sh -i

# Once installed...

## Change your hosts-file
The installer ends with a message suggesting to add an entry to your hosts-file (that is: of the VM-host).
Follow this suggestion if you want to use the OpenConext service from outside of the VM..

## Visit Welcome URL
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

    smb://address/www
    username: openconext
    password: openconext

where ``address`` is the ip address of your VM.

### MySQL access
If you want to query or update the database you will have to open up port 3306. Type in a VM shell:

    iptables -I INPUT -p tcp -m tcp  --dport 3306 -j ACCEPT

The MySQL root-password is ``c0n3xt``.

# Upgrades

From OpenConext release 45 onwards, upgrades are supported. Refer to the [available releases and release notes](https://wiki.surfnetlabs.nl/display/OpenConext/Releases).

## 1. Get the latest version of the OpenConext VM installer

For one time installations, getting a tarball from the Github repo suffices, as described above in the installation instructions.
But to upgrade your OpenConext instance, it's better to have a clone of the repository.

Run within the VM:

    git clone https://github.com/OpenConext/OpenConext-vm

(or pull in the latest changes if you cloned before):

    cd OpenConext-vm
    git pull

## 2. Run the upgrade installer

    bash OpenConext-vm/scripts/upgrade_openconext.sh

The installer will ask which version you want to upgrade to.
