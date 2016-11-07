#!/bin/bash
# eZDeven VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf ezapp.box
vagrant package --output ezdeven.box

echo "Destroying machine"
vagrant destroy -f

echo "Replacing box"
vagrant box remove Aplyca/eZDeven
vagrant box add ezdeven.box --name Aplyca/eZDeven

echo "Testing box"
cd tests
vagrant up
vagrant ssh -- "ps aux | grep 'apache|mysql'"
vagrant ssh -- "php -v"
