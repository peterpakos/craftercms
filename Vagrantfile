# -*- mode: ruby -*-
# vi: set ft=ruby :

N = ENV["N"] || "3"
CORES = 2
RAM = 4096

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "peterpakos/centos-7"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", CORES]
    vb.customize ["modifyvm", :id, "--memory", RAM]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  (1..N.to_i).each do |node_id|
    config.vm.define "node#{node_id}" do |node|
      node.vm.network "private_network", ip: "192.168.69.#{10+node_id}"
      if node_id == N.to_i
        node.vm.provision "ansible" do |ansible|
          ansible.limit = "all"
          ansible.playbook = "ansible/craftercms.yml"
        end
      end
    end
  end
end
