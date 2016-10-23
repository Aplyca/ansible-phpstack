#!/bin/bash
# eZApp VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf ezapp.web.box
vagrant package --output ezapp.web.box

echo "Destroying machine"
vagrant destroy -f

echo "Replacing box"
vagrant box remove Aplyca/ezapp.web
vagrant box add ezapp.web.box --name Aplyca/ezapp.web

echo "Testing box"
cd tests
vagrant up
vagrant ssh -- "ps aux | grep 'apache|mysql'"
vagrant ssh -- "php -v"
