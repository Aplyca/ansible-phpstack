#!/bin/bash
# LAMPDeven VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf lampdeven.box
vagrant package --output lampdeven.box

echo "Destroying machine"
vagrant destroy -f

echo "Replacing box"
cd tests
vagrant destroy -f
vagrant box remove Test/LAMPDeven
vagrant box add lampdeven.box --name Test/LAMPDeven

echo "Testing box"
vagrant up --no-provision
vagrant ssh -- "ps aux | grep -E 'apache|mysql'"
vagrant ssh -- "php -v"
