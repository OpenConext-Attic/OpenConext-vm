Requirements
============
* Ansible
* Librarian Ansible

Install the roles with:
```
cd tools/ansible && librarian-ansible install
```

Install
=======
Install the entire platform:
```
ansible-playbook -i inventory/demo.openconext.ini site.yml
```

Install only EngineBlock:
```
ansible-playbook -i inventory/demo.openconext.ini engineblock.yml
```