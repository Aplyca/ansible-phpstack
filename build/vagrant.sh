#!/bin/bash
# eZ VM box with ansible

echo "Starting VM and provision with role"
vagrant box update
vagrant destroy -f
vagrant up

echo "Packaging box"
vagrant package --output ezapp.web.box

echo "Destroying machine"
vagrant destroy -f
