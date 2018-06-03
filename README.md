## Overview

These are my ansible playbooks to configure multiple things. This is for Arch Linux only.

### Playbooks installation

+ Make sure that your hostname is define on **/etc/hosts**:

	```
	#
	# /etc/hosts: static lookup table for host names
	#

	#<ip-address>	<hostname.domain.org>	<hostname>
	127.0.0.1	localhost.localdomain	localhost
	::1	localhost.localdomain	localhost
	127.0.1.1	**hostname**.localdomain**hostanme**

	# End of file
	```

+ Download configuration file:

```shell
curl -LOJ https://raw.githubusercontent.com/arperalta3/playbooks/master/configure-ansible.sh >> configure-ansible.sh
```

+ Run ansible configuration:

```shell
chmod +x configure-ansible.sh
./configure-ansible.sh
```

### Configure an arch linux instalation

+ Prerequisites
  + base-devel installed

+ Find playbook

```shell
cd ~/.config/playbooks/
```

+ Run playbook

 ```shell
sh configure-arch.sh
```

### Acknowledgement

- [Alan Thomas dotfiles](https://github.com/alanctkc/dotfiles)
- [Alex Palcuie dotfiles](https://github.com/palcu/dotfiles)
