sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

sudo scp -o StrictHostKeyChecking=no -i /tmp/id_rsa vagrant@192.168.42.110:/tmp/token /tmp/token

server_token="$(sudo cat /tmp/token)"
server_url="https://192.168.42.110:6443"
curl -sfL https://get.k3s.io | K3S_URL=${server_url} K3S_TOKEN=${server_token} sh -s - --flannel-iface eth1 
