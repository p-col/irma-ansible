IRMA Ansible Provisioning
=========================

This is a special Readme for the HiTB conference.


What You’ll need?
-----------------

- [Ansible](http://www.ansible.com) 1.6 or higher
- One or multiple 64-bit [Debian](https://www.debian.org) 7 servers. They should
  have been configured as mentionned in the Prerequisites section

For *test or development* purposes (optional):

- [Vagrant](http://www.vagrantup.com/) 1.5 or higher has to be installed
- As the installation work only for [Virtualbox](https://www.virtualbox.org/),
  you’ll need to install it
- [Vagrant VBGuest](https://github.com/dotless-de/vagrant-vbguest) to speed up
  your VM
- [Rsync](https://rsync.samba.org/) for directories copy between host and VMs
- Read the [Ansible introduction](http://docs.ansible.com/intro.html)


Getting Started
---------------

### 1. Clone the repository

Using [Git](http://git-scm.com/) software, clone the repository:
```
$ git clone --recursive
```


### 2. Install Ansible dependencies

Dependencies are available via [Ansible Galaxy](https://galaxy.ansible.com/)
repository. Installation has been made easy using:

```
$ ansible-galaxy install -r galaxy.yml -p ./roles # --force if you’ve already installed it
```


### 3. Install Ansible dependencies

Let’s go:

```
$ vagrant up
```

Vagrant will launch a VM and install IRMA on it. It can take a while
(from 5 to 10 min) depending on the amount of RAM you have on your computer
and the hard disk drive I/O speed.

Then, for proper use, update your `/etc/hosts` file and add:

```
172.16.1.30    www.frontend.irma
```

### 4. Enjoy!

IRMA allinone is available at [www.frontend.irma](http://www.frontend.irma).


### 5. Develop your Probe

TODO


Speed up your Vagrant VMs
-------------------------

Install this softwares:
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest): `vagrant plugin
  install vagrant-vbguest`


Contributing
------------

Check the ”Test or develop IRMA using Vagrant” and feel free to submit pull
requests.


IRMA on IRC
-----------

Feel free to check out our IRC channel on Freenode #qb_irma, if you have
questions or any technical issues.


Credits
-------

Some of roles from [Ansible Galaxy](https://galaxy.ansible.com/) used here:
- MongoDB role from [Stouts/Stouts.mongodb](https://github.com/Stouts/Stouts.mongodb)
- NodeJS role from [JasonGiedymin/nodejs](https://github.com/AnsibleShipyard/ansible-nodejs)
- Nginx role from [jdauphant/ansible-role-nginx](https://github.com/jdauphant/ansible-role-nginx)
- OpenSSH role from [Ansibles/openssh](https://github.com/Ansibles/openssh)
- Sudo role from [weareinteractive/ansible-sudo](https://github.com/weareinteractive/ansible-sudo)
- Users role from [mivok/ansible-users](https://github.com/mivok/ansible-users)
- uWSGI role from [gdamjan/ansible-uwsgi](https://github.com/gdamjan/ansible-uwsgi)
