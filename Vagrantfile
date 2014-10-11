# -*- mode: ruby -*-
# vi: set ft=ruby :

# set minimal Vagrant version
Vagrant.require_version ">= 1.5.0"

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
    config.cache.auto_detect = false
  end

  config.vm.define "allinone" do |allinone|
    allinone.vm.box = "irma-1.1.0-2"
    allinone.vm.box_url = "http://irma.quarkslab.com/download/1.1.0/irma-1.1.0-2.box"
    allinone.vm.hostname = "brain.irma"
    allinone.vm.network "private_network", ip: "172.16.1.30"

    allinone.vm.provider "virtualbox" do |v|
      #v.gui = true
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", 100]
      v.customize ["modifyvm", :id, "--memory", 2048]
    end
  end

  config.vm.define "myprobe" do |myprobe|
    myprobe.vm.box = "puphpet/debian75-x64"
    myprobe.vm.hostname = "myprobe.irma"
    myprobe.vm.network "private_network", ip: "172.16.1.42"

    myprobe.vm.provider "virtualbox" do |v|
      #v.gui = true
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", 50]
      v.customize ["modifyvm", :id, "--memory", 1024]
    end

    myprobe.vm.provision :ansible do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.extra_vars = {
        vagrant: true,
        vagrant_share: false
      }
      ansible.groups = {
        "probe" => ["myprobe"]
      }

      #ansible.tags = ['']
      #ansible.skip_tags = ['']
      #ansible.verbose = 'vvvv'
      #ansible.raw_arguments = ['--check','--diff']
    end
  end
end
