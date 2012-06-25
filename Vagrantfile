# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "demo.openconext.org"

  # Boot with a GUI so you can see the screen. (Default is headless)
  config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "172.18.5.2"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"
  
  config.vm.provision :shell, :path => "scripts/tomcat_install.sh"
  config.vm.provision :shell, :path => "scripts/mysql_install.sh"
  config.vm.provision :shell, :path => "scripts/httpd_install.sh"
  config.vm.provision :shell, :path => "scripts/php_install.sh"
  config.vm.provision :shell, :path => "scripts/openldap_install.sh"
  config.vm.provision :shell, :path => "scripts/memcached_install.sh"
  config.vm.provision :shell, :path => "scripts/maven_install.sh"

  config.vm.provision :shell, :path => "scripts/hosts_install.sh"
  config.vm.provision :shell, :path => "scripts/firewall_disable.sh"

  config.vm.provision :shell, :path => "scripts/openconext_www.sh"
  config.vm.provision :shell, :path => "scripts/openconext_logging.sh"
  config.vm.provision :shell, :path => "scripts/openconext_configuration.sh"
  config.vm.provision :shell, :path => "scripts/samba_install.sh"

  config.vm.provision :shell, :path => "scripts/mujina_install.sh"
  config.vm.provision :shell, :path => "scripts/openconext_static.sh"
  config.vm.provision :shell, :path => "scripts/openconext_engine_install.sh"
  config.vm.provision :shell, :path => "scripts/openconext_ldap.sh"
  config.vm.provision :shell, :path => "scripts/openconext_serviceregistry_install.sh"
  config.vm.provision :shell, :path => "scripts/openconext_manage_install.sh"
  config.vm.provision :shell, :path => "scripts/openconext_api.sh"

  config.vm.provision :shell, :path => "scripts/chown_www.sh"

  config.vm.provision :shell, :path => "scripts/shibboleth_install.sh"

  config.vm.provision :shell, :path => "scripts/openconext_infra_httpd.sh"
  
  config.vm.provision :shell, :path => "scripts/grouper.sh"
  
  config.vm.provision :shell, :path => "scripts/openconext_teams.sh"
  
  #config.vm.provision :chef_solo do |chef|
  #  chef.cookbooks_path = "cookbooks"
  #  chef.add_recipe "selinux::disabled"
  #  chef.add_recipe "java::oracle"
  #  chef.add_recipe "mysql"
  #  chef.add_recipe "mysql::server"
  #
  #  chef.json = {
  #     "mysql" => {
  #       "server_root_password"   => "conext",
  #       "server_repl_password"   => "conext",
  #       "server_debian_password" => "conext"
  #     }
  #   }
  #end
end
