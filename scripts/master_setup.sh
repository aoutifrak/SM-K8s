# sudo apt update && sudo apt install systemd -y
# #enabling the cgroups for k3s https://askubuntu.com/questions/1237813/enabling-memory-cgroup-in-ubuntu-20-04
# sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory cgroup_memory=1 systemd.unified_cgroup_hierarchy=0"/' /etc/default/grub
# sudo update-grub
# sudo reboot
# sudo mkdir -p /etc/rancher/k3s
# sudo tee /etc/rancher/k3s/config.yaml << EOF
# # Node configuration
# node-name: $(hostname)
# node-ip: "$1" 

# # Networking
# bind-address: "$1"
# advertise-address: "$1"

# # Security
# write-kubeconfig-mode: "644"  # Makes kubeconfig readable for non-root users
# token-file: "/vag/token"

# EOF
#install k3s https://docs.k3s.io/cli/server
export INSTALL_K3S_EXEC="server \
  --node-ip=$1 \
  --advertise-address=$1 \
  --bind-address=$1 \
  --write-kubeconfig-mode 644"

curl -sfL https://get.k3s.io | sh
cp /var/lib/rancher/k3s/server/token /vag/token
echo 'alias k="/usr/local/bin/k3s"' > ~/.bashrc
