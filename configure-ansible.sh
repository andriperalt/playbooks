#! /bin/sh

printf "\n\nConfigure correct clock\n\n"
sudo timedatectl set-ntp true
sudo hwclock --systohc --utc

printf "\n\nInstalling reflector\n\n"
sudo pacman -S --needed reflector

printf "\n\nRunning reflector\n\n"
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist

printf "\n\nInstalling packages gnome-keyring, git, python, openssh and ansible\n\n"
sudo pacman -S --needed gnome-keyring git python openssh ansible

printf "\n\nStarting ssh service\n\n"
sudo systemctl start sshd.socket

printf "\n\nGenerating ssh-keygen\n\n"
ssh-keygen -t rsa -b 4096

printf "\n\nCopying ssh-key\n\n"
ssh-copy-id $USER@localhost

printf "\n\nCloning ansible-pacaur repo\n\n"
git clone https://github.com/arperalta3/ansible-pacaur.git ~/.config/ansible-pacaur

printf "\n\nCloning ansible-human-log repo\n\n"
git clone https://gist.github.com/cd706de198c85a8255f6.git ~/.config/ansible-human-log

printf "\n\nCloning playbooks repo\n\n"
git clone https://github.com/arperalta3/playbooks.git ~/.config/playbooks

printf "\n\nLinking ansible library pacaur\n\n"
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/playbooks/ansible-playbooks/library/pacaur

printf "\n\nLinking ansible callback human log\n\n"
ln -s ~/.config/ansible-human-log/human_log.py ~/.config/playbooks/ansible-playbooks/callback_plugins/human_log.py
