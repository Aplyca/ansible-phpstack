#!/bin/bash
# eZApp VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
rm -rf ezdev.web.box
vagrant package --output ezdev.web.box

echo "Destroying machine"
vagrant destroy -f

echo "Replacing box"
vagrant box remove Aplyca/ezapp.web
vagrant box add ezdev.web.box --name Aplyca/ezdev.web

echo "Testing box"
cd tests
vagrant up
vagrant ssh
