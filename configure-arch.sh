#!/bin/zsh
# ansible-playbook --ask-sudo-pass -i LOCAL arch.yml
ansible-playbook -i ansible-playbooks/inventories/LOCAL ansible-playbooks/arch.yml
