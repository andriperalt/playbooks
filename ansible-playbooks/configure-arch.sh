#! /bin/bash

ansible-playbook -v --ask-become-pass -i inventories/LOCAL arch.yml
