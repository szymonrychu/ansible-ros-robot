#!/bin/bash

which python3 2> /dev/null || sudo apt-get install python3 -y
which pip3 2> /dev/null    || sudo apt-get install python3-pip -y
which ansible 2> /dev/null || sudo pip3 install ansible

sudo ansible-playbook -i localhost playbook.yaml