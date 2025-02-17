#commen config
BOX = "centos/8"
MASTER_NAME = "aoutifras"
WORKER_NAME = "aoutifaw"
MASTER_IP = "192.168.42.10"
WORKER_IP = "192.168.42.11"
MEM = 512
CPU = 1

# Vagrant setup

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  config.vm.box_check_update = false
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.provider "virtualbox" do |v|
    v.memory = MEM
    v.cpus = CPU
  end
  config.vm.define MASTER_NAME do |master|
    master.vm.hostname = MASTER_NAME
    master.vm.network "private_network" , ip: MASTER_IP
    master.vm.provision "shell", privileged: true, path: "scripts/master_setup.sh", args: [MASTER_IP]
    master.vm.synced_folder ".", "/vagran", type: "virtualbox"
  end
  config.vm.define WORKER_NAME do |worker|
    worker.vm.hostname = WORKER_NAME
    worker.vm.network "private_network" , ip: WORKER_IP
    worker.vm.provision "shell", privileged: true, path: "scripts/worker_setup.sh", args: [WORKER_IP]
    worker.vm.synced_folder ".", "/vagran", type: "virtualbox"
  end
end
