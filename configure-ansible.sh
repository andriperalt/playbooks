#!/bin/bash

# Prepare logs
>configure-ansible.out
>configure-ansible.err
exec > >(tee -ia configure-ansible.out) 2> >(tee -ia configure-ansible.err >&2)

# Fail if variables unset
set -o nounset

# Fail if any error
set -o errexit

# Fail if any error in pipelines
set -o pipefail

configure_clock() {
  sudo timedatectl set-ntp true
  sudo hwclock --systohc --utc
}

configure_mirrors() {
  sudo pacman -S --needed reflector
  sudo reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist
}

install_deps() {
  sudo pacman -S --needed gnome-keyring libsecret seahorse git python openssh ansible
}

install_pacaur() {
  git clone https://aur.archlinux.org/cower.git ~/.config/cower
  gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
  cd ~/.config/cower && exec makepkg -si
  git clone https://aur.archlinux.org/pacaur.git ~/.config/pacaur
  cd ~/.config/pacaur && exec makepkg -si
}

configure_ssh() {
  sudo systemctl start sshd.socket
  sudo systemctl enable sshd.socket
  ssh-keygen -t rsa -b 4096
  ssh-copy-id "$USER@localhost"
}

configure_playbooks() {
  rm -rf ~/.config/playbooks ~/.config/ansible-pacaur ~/.config/ansible-human-log
  git clone https://github.com/sanderboom/ansible-pacaur ~/.config/ansible-pacaur
  git clone https://github.com/jinesh-choksi/ansible-human_log.git ~/.config/ansible-human-log
  git clone https://github.com/arperalta3/playbooks.git ~/.config/playbooks
  ln -s ~/.config/ansible-pacaur/pacaur ~/.config/playbooks/ansible-playbooks/library/pacaur
  ln -s ~/.config/ansible-human-log/human_log.py ~/.config/playbooks/ansible-playbooks/callback_plugins/human_log.py
}

if [[ $UID != 0 ]]; then
  echo "Please run this script with sudo:"
  echo "sudo $0 $*"
  exit 1
fi
if ! configure_clock; then echo "Configuration of clock failed"; exit 1; fi
if ! configure_mirrors; then echo "Configuration of mirrors failed"; exit 1; fi
if ! install_deps; then echo "Installation of packages gnome-keyring, git, python, openssh and ansible failed"; exit 1; fi
if ! install_pacaur; then echo "Installation of pacaur failed"; exit 1; fi
if ! configure_ssh; then echo "Configuration of ssh failed"; exit 1; fi
if ! configure_playbooks; then echo "Configuration of ansible playbooks failed"; exit 1; fi
