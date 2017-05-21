#!/bin/bash
# LAMPDeven VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf phpstack.box
vagrant package --output phpstack.box

echo "Destroying machine"
#vagrant destroy -f

echo "Replacing box"

vagrant box remove Test/PHPStack --force
vagrant box add phpstack.box --name Test/PHPStack

echo "Testing box"
cd tests
vagrant destroy -f
vagrant up --no-provision
vagrant ssh -- "ps aux | grep -E 'apache|mysql'"
vagrant ssh -- "php -v"
