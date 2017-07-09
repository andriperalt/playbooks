## Overview

This is my Arch Linux configuration using Ansible.

### Dotfiles installation

1. Install [Python 3](https://wiki.archlinux.org/index.php/Python), [OpenSSH](https://wiki.archlinux.org/index.php/Secure_Shell) and [Ansible](https://wiki.archlinux.org/index.php/Ansible):

    ```
    $ pacaur -S python openssh ansible
    ```

2. Clone this repo:

    ```
    $ git clone https://github.com/sanderboom/ansible-pacaur.git ~/.config/ansible-pacaur
    $ git clone git@gitlab.com:arperalta3/dotfiles.git ~/.config/dotfiles
    ```

3. Run the Ansible playbook:

    ```
    $ ln -s ~/.config/ansible-pacaur/pacaur ~/.config/dotfiles/ansible-playbooks/library/pacaur
    $ cd ~/.config/dotfiles/
    $ sh configure-arch.sh
    ```

### Acknowledgement

- [Alan Thomas dotfiles](https://github.com/alanctkc/dotfiles)
- [Alex Palcuie dotfiles](https://github.com/palcu/dotfiles)
