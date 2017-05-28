#!/bin/zsh
ansible-playbook --ask-sudo-pass -i inventory -c local playbooks/desktop.yml