# wp.vagrant

Puppet infused Vagrant LAMP stack for a local WordPress instance

### Usage:

 - 1️⃣ Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)
 - 2️⃣ Run `vagrant up`
 - 3️⃣ Add `192.168.19.50 wp.test` to `\hosts\etc` (instructions: [MacOS](https://markinns.com/archive/how-to-setup-a-local-dns-host-file-on-mac-os-x.html), [Windows](https://helpdeskgeek.com/networking/edit-hosts-file/))

Visit `http://wp.test` to finish installing WordPress

### todo:

 - [ ] Override configuration for local IP & .test domain name
 - [ ] Multiple WordPress instances per box
 - [ ] Documentation on configuration & extension

