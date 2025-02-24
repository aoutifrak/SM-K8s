
export INSTALL_K3S_EXEC="server \
  --node-ip=$1 \
  --advertise-address=$1 \
  --bind-address=$1 \
  --write-kubeconfig-mode 644"

curl -sfL https://get.k3s.io | sh
# echo 'alias k="/usr/local/bin/k3s"' > ~/.bashrc this is not working
ln -s /usr/local/bin/k3s /bin/k

k kubectl apply -f /vag/k3s-deploy/app1/

sleep 6

cp /vag/k3s-deploy/app1/index/html /usr/share/nginx/html