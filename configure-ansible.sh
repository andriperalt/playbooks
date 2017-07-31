#!/bin/bash

# Prepare logs
>configure-ansible.log
>configure-ansible.err
exec > >(tee -ia configure-ansible.log) 2> >(tee -ia configure-ansible.err >&2)

# Fail if variables unset
set -o nounset
# Fail if any error
set -o errexit

{
  echo "====== INFO: Configuring correct clock ======" \
  && sudo timedatectl set-ntp true \
  && sudo hwclock --systohc --utc \
  && echo "====== INFO: Configuring correct clock ======" \
  && echo ""
} && {
  echo "====== INFO: Installing reflector ======" \
  && sudo pacman -S --needed reflector \
  && echo "====== INFO: Installed reflector ======" \
} && {
  echo "Running reflector" \
  && sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
} && {
  echo "Installing packages gnome-keyring, git, python, openssh and ansible" \
  && sudo pacman -S --needed gnome-keyring libsecret seahorse git python openssh ansible
} && {
  echo "\n\nInstalling cower for pacaur\n\n" \
  && git clone https://aur.archlinux.org/cower.git ~/.config/cower \
  && gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53 \
  && cd ~/.config/cower && exec makepkg -si
} && {
  printf "\n\nInstalling pacaur\n\n" \
  && git clone https://aur.archlinux.org/pacaur.git ~/.config/pacaur \
  && cd ~/.config/pacaur && exec makepkg -si
} && {
  echo "\n\nStarting ssh service\n\n" \
  && sudo systemctl start sshd.socket
} && {
  echo "\n\nGenerating ssh-keygen\n\n" \
  && ssh-keygen -t rsa -b 4096
} && {
  echo "\n\nCopying ssh-key\n\n" \
  && ssh-copy-id $USER@localhost
} && {
  echo "\n\nRemove repos\n\n" \
  && rm -rf ~/.config/playbooks ~/.config/ansible-pacaur ~/.config/ansible-human-log
} && {
  echo "\n\nCloning ansible-pacaur repo\n\n" \
  && git clone https://github.com/arperalta3/ansible-pacaur.git ~/.config/ansible-pacaur
} && {
  echo "\n\nCloning ansible-human-log repo\n\n" \
  && git clone https://github.com/jinesh-choksi/ansible-human_log.git ~/.config/ansible-human-log
} && {
  echo "Cloning playbooks repo" \
  && git clone https://github.com/arperalta3/playbooks.git ~/.config/playbooks
} && {
  echo "Linking ansible library pacaur" \
  && ln -s ~/.config/ansible-pacaur/pacaur ~/.config/playbooks/ansible-playbooks/library/pacaur
} && {
  echo "Linking ansible callback human log" \
  && ln -s ~/.config/ansible-human-log/human_log.py ~/.config/playbooks/ansible-playbooks/callback_plugins/human_log.py
}
