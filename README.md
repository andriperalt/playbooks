## Overview

This is my Arch Linux and rxvt using Ansible.

### Dotfiles installation

1. Install [Python 3](https://wiki.archlinux.org/index.php/Python), [OpenSSH](https://wiki.archlinux.org/index.php/Secure_Shell) and [Ansible](https://wiki.archlinux.org/index.php/Ansible):

    ```
    $ pacaur -S python openssh ansible
    ```

2. Clone this repo:

    ```
    $ git clone git@gitlab.com:arperalta3/dotfiles.git ~/.config/dotfiles
    ```

3. Run the Ansible playbook:

    ```
    $ cd ~/.config/dotfiles/ansible-playbooks/
    $ ./configure-arch.sh
    ```

### Acknowledgement

- [Alan Thomas dotfiles](https://github.com/alanctkc/dotfiles)
- [Alex Palcuie dotfiles](https://github.com/palcu/dotfiles)