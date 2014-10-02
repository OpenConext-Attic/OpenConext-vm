# OpenConext Virtual Machine

These are the resources required to build an OpenConext Virtual Machine.

OpenConext is the completely Open Source version of the educational collaboration platform that is used in the Netherlands, SURFconext.
For more information regarding OpenConext, refer to the documentation at [http://www.openconext.org](http://www.openconext.org)

# How to use this OpenConext VM?

You can either:

1.  Install OpenConext on your own server / VM. This option is recommended if you already have a target machine for OpenConext.
2.  Let Vagrant install and manage a new virtual machine for you. This option is recommended if you already use Vagrant.

## Option 1. I already have a machine I want to install OpenConext on.
Prerequisites:
* a VM running CentOS 6 or RedHat EL 6 (other operating systems may work, but are not supported).

### 1.1. Download installer
From within the VM, download this repo:

```bash
curl https://codeload.github.com/OpenConext/OpenConext-vm/tar.gz/v74.4 | tar zx
```

### 1.2. Change the default VM settings
Copy the oc_config.sh file:
```bash
install -d /etc/openconext
cp OpenConext-vm-74.4/scripts/oc_config.sh /etc/openconext/.
```

The OpenConext VM has a script to change all the default passwords to new random passwords.
```bash
pushd /etc/openconext
~/OpenConext-vm-74.4/scripts/oc_setpasswds.sh
popd
```


Adapt the VM settings to you likings using the comments in the /etc/openconext/oc_config.sh file.
 
### 1.3. Run the installer
Run the install script:

```bash
bash OpenConext-vm-74.4/scripts/install_openconext.sh
```

By default, the installer will run an 'unattended' setup, choosing sensible defaults.
If you want to install a specific version of the platform, install a subset of components or change the default domain (demo.openconext.org), run the installer with a ````-i```` flag:

```bash
bash OpenConext-vm-74.4/scripts/install_openconext.sh -i
```

## Option 2. Letting Vagrant set up a new virtual machine.

Prerequisites:
* Recent version of [Vagrant](https://www.vagrantup.com)

### 2.1. Make a new directory for all OpenConext code

Example for OS X:
```bash
mkdir ~/Sites/OpenConext
cd ~/Sites/OpenConext
```

### 2.2. Download the VM project there
```bash
curl https://codeload.github.com/OpenConext/OpenConext-vm/tar.gz/v74.4 | tar zxv
```

### 2.3 Up, up and away!
You should now have a directory called OpenConext-vm-v62, go there and run vagrant up.
```bash
cd OpenConext-vm-v74.4 && vagrant up
```

Vagrant will download the basebox, set it up with NFS and install OpenConext for you.



# Once installed...

## Change your hosts-file
The installer ends with a message suggesting to add an entry to your hosts-file (that is: of the VM-host).
Follow this suggestion if you want to use the OpenConext service from outside of the VM.

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

```bash
iptables -I INPUT -p tcp -m tcp  --dport 3306 -j ACCEPT && service iptables save
```

The MySQL root-password is ``c0n3xt``.

# Upgrades

Please note that we unfortunately do not support upgrades from earlier versions of OpenConext.

We are working on a new version of the VM that is Ansible based and should ensure better support for upgrades.
