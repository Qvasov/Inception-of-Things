mkdir -p /home/root/.ssh/
cp /tmp/id_rsa /home/vagrant/.ssh/id_rsa
cp /tmp/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
scp -o StrictHostKeyChecking=no vagrant@192.168.42.110:/tmp/token /tmp/token

#sudo yum update -y
#sudo yum install -y net-tools

#curl -sfL https://get.k3s.io | sh -s - agent --config /vagrant/confs/k3s_agent.yaml
