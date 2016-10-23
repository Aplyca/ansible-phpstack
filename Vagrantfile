Vagrant.configure(2) do |config|
  config.vm.define "dev.ezapp.web", primary: true, autostart: true do |config_machine|
      config.vm.synced_folder ".", "/vagrant", disabled: true
      #Assigning a provider
      config_machine.vm.provider :virtualbox do |virtualbox, override|
          virtualbox.name = "Dev eZApp Web"
          virtualbox.cpus = 8
          virtualbox.memory = 2048
		  override.vm.box = "ubuntu/trusty64"

          config_machine.ssh.private_key_path = ["~/.vagrant.d/insecure_private_key", "~/.ssh/dev.ezapp.web"]
          config_machine.ssh.insert_key = false
      end

      # Asinging a provisioner
      config_machine.vm.provision :ansible, run: "always" do |provisioner|
          provisioner.playbook = "playbooks.yml"
          provisioner.extra_vars = "tests/test.yml" if File.file?("tests/test.yml")
          #provisioner.verbose = "v"
          #provisioner.tags = "vars"
      end
  end
end
