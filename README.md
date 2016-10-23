# eZ App Environment provisioned by Ansible

## SSH

* Use your SSH config file (~/.ssh/config) to confgire all the SSH connections, for example the inventory hosts connections.
* Use SSH keys to connect to remote hosts
* Use diferent SSH keys for diffrent environments (development/stage/prod)

## Ansible
* Read how to use the **Ansible** provisioner in README.md of each role.
* To know more about Ansible: http://www.ansible.com

### Dependencies
Install the rol dependencies using Ansible Galaxy

```bash
ansible-galaxy install -r requirements.yml
```
## Running provision

List tasks and hosts before provision:

```bash
ansible-playbook -i inventories/prod playbooks.yml --list-tasks --list-hosts
```

Provision Stage:

```bash
ansible-playbook -i inventories/stage playbooks.yml
```

Provision Prod:

```bash
ansible-playbook -i inventories/prod playbooks.yml
```

### Running feature provision

Use tags to run a specific feature in the provisio, i.e: to update the synonyms of the SOlr server you can run the following command:

Synonyms:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags synonyms
```

Paths:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags paths
```

Crontab:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags crontab
```

Virtualhosts:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags vhost
```

AWS CloudWatch Logs:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags awslogs
```

MySQL Users:

```bash
ansible-playbook -i inventories/prod playbooks.yml --tags mysqlusers
```

### Custom settings
In order to use your own custom settings, use the "custom.yml" file, you can overide any varible used in the playbooks and roles.

```bash
ansible-playbook -i inventories/prod playbooks.yml --extra-vars "@custom.yml"
```

By default the custom.yml file is ignored in git, be mindful to not add to version control your custom files or info.

### Inventory
See the `inventories` folders to know the available inventories
Use the "inventories/custom" to place your custom inventory.

## Tests
```bash
ansible-playbook -i inventories/prod tests/playbooks.yml
```

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
