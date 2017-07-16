#! /bin/sh

# Install packages python, openssh and ansible
sudo pacman -S python openssh ansible git

# Clone ansible-packer repo
git clone https://github.com/arperalta3/ansible-packer.git ~/.config/ansible-pacaur

# Clone dotfiles repo
git clone https://github.com/arperalta3/dotfiles.git ~/.config/dotfiles

# Link ansible library pacaur
ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur

# Set current directory to dotfiles repo
cd ~/.config/dotfiles/
