host = RbConfig::CONFIG['host_os']
if host =~ /darwin/
  cpus = `sysctl -n hw.ncpu`.to_i
elsif host =~ /linux/
  cpus = `nproc`.to_i
else
  cpus = 2
end

Vagrant.configure(2) do |config|
  config.vm.define "phpstack-provision.vagrant", primary: true, autostart: true do |config_machine|
      config.vm.synced_folder ".", "/vagrant", disabled: true
      #Assigning a provider
      config_machine.vm.provider :virtualbox do |virtualbox, override|
          virtualbox.name = "Vagrant PHPStack Provision"
          virtualbox.memory = 2048
          virtualbox.cpus = cpus
          virtualbox.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
          virtualbox.customize [ "modifyvm", :id, "--audio", "none" ]
          virtualbox.customize [ "modifyvm", :id, "--boot1", "disk" ]
          virtualbox.customize [ "modifyvm", :id, "--boot2", "none" ]
          virtualbox.customize [ "modifyvm", :id, "--boot3", "none" ]
          #override.vm.box = "ubuntu/trusty64"
          override.vm.box = "ubuntu/xenial64"
      end

      # Asinging a provisioner
      config_machine.vm.provision :ansible, run: "always" do |provisioner|
          provisioner.playbook = "playbooks.yml"
          provisioner.extra_vars = "tests/test.yml" if File.file?("tests/test.yml")
          #provisioner.galaxy_role_file = "roles/requirements.yml"
          #provisioner.galaxy_roles_path = "roles"
          provisioner.raw_arguments = ["-e ansible_python_interpreter=/usr/bin/python3"]
          #provisioner.verbose = "v"
          #provisioner.tags = "vars"
      end
  end
end
