## Overview

These are my ansible playbooks to configure multiple things. This is for Arch Linux only.

### Playbooks installation

+ Make sure that your hostname is correted define on **/etc/hosts**

	+ See hostname
	
	```
	$ hostname
	```

  + Corrected configured **/etc/hosts**

	```
	#
	# /etc/hosts: static lookup table for host names
	#

	#<ip-address>	<hostname.domain.org>	<hostname>
	127.0.0.1	localhost.localdomain	localhost
	::1	localhost.localdomain	localhost
	127.0.1.1	**hostname**.localdomain	**hostname**

	# End of file
	```

+ Download configuration file:

```
$ curl -LOJ https://raw.githubusercontent.com/arperalta3/playbooks/master/configure-ansible.sh >> configure-ansible.sh
```

+ Run ansible configuration:

```
$ sh configure-ansible.sh
```

### Configure an arch linux configuration

+ Find playbook

```
$ cd ~/.config/playbooks/
```

+ Run playbook

 ```
$ sh configure-arch.sh
```

### Acknowledgement

- [Alan Thomas dotfiles](https://github.com/alanctkc/dotfiles)
- [Alex Palcuie dotfiles](https://github.com/palcu/dotfiles)
