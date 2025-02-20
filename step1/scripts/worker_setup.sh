export K3S_URL="https://$1:6443"
export K3S_TOKEN=$(cat /vag/token)
export INSTALL_K3S_EXEC="agent \
--node-ip=$1"

curl -sfL https://get.k3s.io | sh