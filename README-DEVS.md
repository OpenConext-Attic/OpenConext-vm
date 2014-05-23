# Definition of terms

An OpenConext Component is a separate piece of software that conforms to the OpenConext Component Requirements.
An OpenConext Platform is a selection of OpenConext Components.
An OpenConext Environment is a physical (or virtual) hosting environment of 1 or multiple servers for a OpenConext Platform.

# OpenConext Component Requirements

A Component MUST comply to the following to be a valid OpenConext Component.

A Component MAY store it's configuration files in ```/etc/openconext```.

A Component MAY store example configuration for third party components in ```etc/```.

A Component MUST have a public Git URL.
In this repository MUST be a directory ```tools/ansible``` with the following playbooks:

## install.yml
Install MUST be able to install on a Environment and MUST use the 'version' variable.
Install SHOULD check it's own local dependencies (like HTTP, Tomcat, PHP, JRE, etc).
The version variable MAY be filled with a semantic version (like 4.0.1) or a branch name
(like develop, master or feature/ansible-setup).
Install MUST be able to upgrade an existing installation of **any** previous version to it's version.
Install MAY refuse a downgrade.
Install MUST NOT overwrite existing configuration files, but MAY write initial configuration files.
Install SHOULD be idempotent.

## erase.yml
Erase MUST be able to remove a component.

## setup.yml
Setup MUST be called after install and the component has been configured by the environment.
Setup SHOULD check it's configuration.
Setup SHOULD be able to upgrade an existing installation of any previous version.

## version.yml
Version MUST display the currently installed version of the component.
Version MUST return a non-0 status code if the component is not installed.

## Example lifecycle:

```bash
git clone git://url/component.git
git checkout 3.0.0

# Check for existence
ansible-playbook tools/ansible/version.yml

# Initial install
ansible-playbook tools/ansible/install.yml -e "version=3.0.0"

# Configuration
# Settings changed in /etc/openconext/component.ini

# Setup the component
ansible-playbook tools/ansible/setup.yml

# Some time later an update arrives
ansible-playbook tools/ansible/install.yml -e "version=3.0.1"

# Check version
ansible-playbook tools/ansible/version.yml
# Returns "3.0.1"

# A developer decides to switch to a feature development version
ansible-playbook tools/ansible/install.yml -e "version=feature/awesome-feature"

# Check version
ansible-playbook tools/ansible/version.yml
# Returns "feature/awesome-feature"

# The developer releases a new version and switches back to that
ansible-playbook tools/ansible/install.yml -e "version=3.1.0"

# Component is no longer needed and needs to be deinstalled
ansible-playbook tools/ansible/erase.yml
```