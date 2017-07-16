#! /bin/sh

printf "\nConfigure correct clock\n"
sudo timedatectl set-ntp true
sudo hwclock --systohc --utc

printf "\nInstalling reflector\n"
sudo pacman -S reflector

printf "\nRunning reflector\n"
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist

printf "\nInstalling packages python, openssh and ansible\n"
sudo pacman -S python openssh ansible git

printf "\nCloning ansible-packer repo\n"
git clone https://github.com/arperalta3/ansible-packer.git ~/.config/ansible-pacaur

printf "\nCloning dotfiles repo\n"
git clone https://github.com/arperalta3/dotfiles.git ~/.config/dotfiles

printf "\nLinking ansible library pacaur\n"
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur

printf "\nSetting current directory to dotfiles repo\n"
cd ~/.config/dotfiles/
