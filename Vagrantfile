Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "ubuntu" do |node|
    node.vm.provider "virtualbox" do |vb|
       vb.memory = 12000
       vb.gui = false
    end
  end
  config.vm.provision "shell", path: "install-base.sh"
end
