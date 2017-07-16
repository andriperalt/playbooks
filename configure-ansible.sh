#! /bin/sh

sudo pacman -S python openssh ansible

git clone https://github.com/arperalta3/ansible-packer.git ~/.config/ansible-pacaur

git clone https://github.com/arperalta3/dotfiles.git ~/.config/dotfiles

ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur

cd ~/.config/dotfiles/
