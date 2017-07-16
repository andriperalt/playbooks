#! /bin/sh

printf "Configure correct clock"
sudo timedatectl set-ntp true
sudo hwclock --systohc --utc

printf "Installing reflector"
sudo pacman -S reflector

printf "Running reflector"
sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist

printf "Installing packages python, openssh and ansible"
sudo pacman -S python openssh ansible git

printf "Cloning ansible-packer repo"
git clone https://github.com/arperalta3/ansible-packer.git ~/.config/ansible-pacaur

printf "Cloning dotfiles repo"
git clone https://github.com/arperalta3/dotfiles.git ~/.config/dotfiles

printf "Linking ansible library pacaur"
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur

printf "Setting current directory to dotfiles repo"
cd ~/.config/dotfiles/
