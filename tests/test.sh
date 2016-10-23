#!/bin/bash
# test eZApp provisiones with ansible

cd $(dirname "$0") && cd ..

echo "Install dependencies"
ansible-galaxy install -r roles/requirements.yml

echo "Checking syntax"

ansible-playbook -i inventories/local playbooks.yml --connection=local --syntax-check

echo "Running role"
ansible-playbook -i inventories/local playbooks.yml --connection=local

echo "Checking idempotence"
ansible-playbook -i inventories/local playbooks.yml --connection=local | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
