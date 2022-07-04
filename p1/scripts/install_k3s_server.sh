systemctl disable firewalld --now

#sudo yum update -y
#sudo yum install -y net-tools

curl -sfL https://get.k3s.io | sh -s server - --config /vagrant/confs/k3s_server.yaml

sudo cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo cp /var/lib/rancher/k3s/server/token /tmp/token
sudo chown vagrant:vagrant /tmp/token
