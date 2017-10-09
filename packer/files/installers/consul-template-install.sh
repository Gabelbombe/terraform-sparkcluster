#!/bin/bash
# NOTE: implement, https://alexbilbie.com/2017/06/consul-server-cluster-on-ec2/

set -e

CT_VERSION=0.19.3

# install consul
echo "Installing dependencies..."
sudo yum install -y unzip -q -e 0

echo "Fetching consul-template..."
cd /tmp/
wget -q https://releases.hashicorp.com/consul-template/${CT_VERSION}/consul-template_${CT_VERSION}_linux_amd64.zip -O consul-template.zip

echo "Installing consul-template..."
unzip consul-template.zip
sudo rm consul-template.zip
sudo chmod +x consul-template
sudo mv consul-template /usr/bin/
sudo mkdir -m 777 /etc/ctmpl

echo "consul-template installation complete."
