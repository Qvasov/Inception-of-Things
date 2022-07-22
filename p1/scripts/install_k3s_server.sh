sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

systemctl disable firewalld --now

sudo yum update -y
sudo yum install -y net-tools

curl -sfL https://get.k3s.io | sh -s - --flannel-iface eth1 --write-kubeconfig-mode 0644

sudo cp /var/lib/rancher/k3s/server/token /tmp/token
sudo chown vagrant:vagrant /tmp/token

cp /tmp/id_rsa /home/vagrant/.ssh/id_rsa
cp /tmp/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub
cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
