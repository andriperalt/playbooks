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

printf "\n\nCloning ansible-packer repo\n\n"
git clone https://github.com/arperalta3/ansible-packer.git ~/.config/ansible-pacaur

printf "\n\nCloning dotfiles repo\n\n"
git clone https://github.com/arperalta3/dotfiles.git ~/.config/dotfiles

printf "\n\nLinking ansible library pacaur\n\n"
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur

printf "\n\nSetting current directory to dotfiles repo\n\n"
cd ~/.config/dotfiles/
