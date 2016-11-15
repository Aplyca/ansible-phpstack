#!/bin/bash
# eZDeven VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf ezdeven.box
vagrant package --output ezdeven.box

echo "Destroying machine"
vagrant destroy -f

echo "Replacing box"
vagrant box remove Test/eZDeven
vagrant box add ezdeven.box --name Test/eZDeven

echo "Testing box"
cd tests
vagrant up --no-provision
vagrant ssh -- "ps aux | grep -E 'apache|mysql'"
vagrant ssh -- "php -v"
