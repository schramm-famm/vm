$script = <<-SCRIPT
echo "\nPermitRootLogin yes\nStrictModes no" >> /etc/ssh/sshd_config
printf 'vagrant\nvagrant\n' | sudo passwd root
sudo service sshd reload
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision "bootstrap", type: "shell", path: "env/bootstrap.sh"
  config.vm.provision "rootlogin", type: "shell", run: "never" do |s|
    s.inline = $script
  end
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/vm"
  config.vm.synced_folder ENV['SYSC4907'], "/schramm-famm"
  config.vm.hostname = "schramm-famm"
  config.vm.network "private_network", ip: "192.168.69.69"
end
