sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

systemctl disable firewalld --now

curl -sfL https://get.k3s.io | sh -s - --flannel-iface eth1 --write-kubeconfig-mode 0644

/usr/local/bin/kubectl apply -f /vagrant/confs/app1.yaml -f /vagrant/confs/app2.yaml -f /vagrant/confs/app3.yaml 
