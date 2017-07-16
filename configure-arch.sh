#! /bin/bash

ansible-playbook -v --ask-become-pass -i ansible-playbooks/inventories/LOCAL ansible-playbooks/arch.yml
