# eZ Development Environment provisioned by Ansible

## Ansible
* Read how to use the **Ansible** provisioner in README.md of each role.
* To know more about Ansible: http://www.ansible.com

### Dependencies
Install the role dependencies using Ansible Galaxy

```bash
ansible-galaxy install -r roles/requirements.yml
```
## Running provision

List tasks and hosts before provision:

```bash
ansible-playbook -i inventories/local playbooks.yml --list-tasks --list-hosts
```

Provision:

```bash
./build.sh
```

### Custom settings
In order to use your own custom settings, use the "custom.yml" file, you can overide any varible used in the playbooks and roles.

```bash
ansible-playbook -i inventories/local playbooks.yml --extra-vars "@custom.yml"
```

By default the custom.yml file is ignored in git, be mindful to not add to version control your custom files or info.

### Inventory
See the `inventories` folders to know the available inventories
Use the "inventories/custom" to place your custom inventory.

### Vagrant
* You can use Vagrant to set up and provision a VM in order to run tests.
* To know more about Vagrant: http://www.vagrantup.com
  And Vagrant with Ansible: http://docs.vagrantup.com/v2/provisioning/ansible.html

```bash
tests/vagrant.sh
```
### Docker
```bash
tests/docker.sh
```

## Version control
* Use git to push/push all your changes.
