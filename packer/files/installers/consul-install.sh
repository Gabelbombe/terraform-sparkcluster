#!/bin/bash
# NOTE: implement, https://alexbilbie.com/2017/06/consul-server-cluster-on-ec2/

set -e

CONSUL_VERSION=0.9.3

# install consul
echo "Installing dependencies..."
sudo yum install -y unzip -q -e 0

echo "Fetching consul..."
cd /tmp/
wget -q https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -O consul.zip

echo "Installing consul..."
unzip consul.zip
rm consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir -m 777 /etc/consul.d
sudo chmod a+w /var/log
sudo chmod a+w /etc/init/

echo "consul installation complete."
