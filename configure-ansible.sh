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

printf "\n\nInstalling cower for pacaur\n\n"
git clone https://aur.archlinux.org/cower.git ~/.config/cower
(cd ~/.config/cower && exec makepkg -si)

printf "\n\nInstalling pacaur\n\n"
git clone https://aur.archlinux.org/pacaur.git ~/.config/pacaur
(cd ~/.config/pacaur && exec makepkg -si)

printf "\n\nStarting ssh service\n\n"
sudo systemctl start sshd.socket

printf "\n\nGenerating ssh-keygen\n\n"
ssh-keygen -t rsa -b 4096

printf "\n\nCopying ssh-key\n\n"
ssh-copy-id $USER@localhost

printf "\n\nRemove repos\n\n"
rm -rf ~/.config/playbooks ~/.config/ansible-pacaur ~/.config/ansible-human-log

printf "\n\nCloning ansible-pacaur repo\n\n"
git clone https://github.com/arperalta3/ansible-pacaur.git ~/.config/ansible-pacaur

printf "\n\nCloning ansible-human-log repo\n\n"
git clone https://github.com/jinesh-choksi/ansible-human_log.git ~/.config/ansible-human-log

printf "\n\nCloning playbooks repo\n\n"
git clone https://github.com/arperalta3/playbooks.git ~/.config/playbooks

printf "\n\nLinking ansible library pacaur\n\n"
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/playbooks/ansible-playbooks/library/pacaur

printf "\n\nLinking ansible callback human log\n\n"
ln -s ~/.config/ansible-human-log/human_log.py ~/.config/playbooks/ansible-playbooks/callback_plugins/human_log.py
