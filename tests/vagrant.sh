#!/bin/bash
# Test PHPStack provisioned with ansible

echo "Starting VM and provision with role"
vagrant destroy -f &&
vagrant up
