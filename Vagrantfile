# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"


  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # If you disable the default /vagrant share this will fail
  # Tried using # shell, path: "homedir-install.sh" but it runs as root
  # The below is ugly but su - munges the PATH and can't finish apt installs
  config.vm.provision "shell", inline: <<-SHELL
    su vagrant -c 'cd /vagrant && bash homedir-install.sh'
  SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
