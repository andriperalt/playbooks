## Overview

This is my Arch Linux and rxvt using Ansible.

### Dotfiles installation

1. Install [Ansible](https://wiki.archlinux.org/index.php/Ansible):

    ```
    $ sudo pacaur -S ansible
    ```

2. Clone this repo:

    ```
    $ git clone git@gitlab.com:arperalta3/dotfiles.git ~/.config/dotfiles
    ```

3. Run the Ansible playbook:

    ```
    $ cd ~/.config/dotfiles
    $ ./provision-local.sh
    ```

### Acknowledgement

- https://github.com/alanctkc/dotfiles