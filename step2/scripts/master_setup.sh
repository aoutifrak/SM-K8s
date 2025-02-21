
export INSTALL_K3S_EXEC="server \
  --node-ip=$1 \
  --advertise-address=$1 \
  --bind-address=$1 \
  --write-kubeconfig-mode 644"

curl -sfL https://get.k3s.io | sh
# echo 'alias k="/usr/local/bin/k3s"' > ~/.bashrc this is not working
sudo cp /var/lib/rancher/k3s/server/token /vag/token
ln -s /usr/local/bin/k3s /bin/k

