#!/bin/zsh
ansible-playbook --ask-become-pass -i ansible-playbooks/inventories/LOCAL ansible-playbooks/arch.yml
