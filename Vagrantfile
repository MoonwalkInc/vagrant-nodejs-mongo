Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"
	config.vm.provision :shell, path: "vagrant-config/provision.sh"
	config.vm.provision "shell", run: "always", path: "vagrant-config/startup.sh"
	config.vm.network :forwarded_port, guest: 3000, host: 3000
	config.vm.network :forwarded_port, guest: 27017, host: 27017
	#config.vm.hostname = "moonwalk-api.lo.moonwalk.com
	config.vm.provider "virtualbox" do |v|
	  v.name = "moonwalk local development"
	end


	#config.vm.network "private_network", type: "dhcp"
	config.vm.network "private_network", ip: "192.168.233.33"
	# Use nfs instead of the default folder sync as otherwise VirtualBox will crash periodically
	config.vm.synced_folder ".", "/vagrant", type: "nfs"

end
