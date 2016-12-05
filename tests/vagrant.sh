#!/bin/bash
# Test LAMPDeven provisioned with ansible

echo "Starting VM and provision with role"
vagrant destroy -f &&
vagrant up
