#!/bin/bash

set -e

SPARK_VERSION=1.4.1

sudo yum install -y openjdk-7-jre-headless

echo "Fetching spark-$SPARK_VERSION..."
wget -q http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.6.tgz -O /tmp/spark-${SPARK_VERSION}-bin-hadoop2.6.tgz
echo "Installing spark-$SPARK_VERSION..."
sudo mkdir /opt/spark/
sudo tar xzf /tmp/spark-${SPARK_VERSION}-bin-hadoop2.6.tgz -C /opt/spark/
sudo ln -s /opt/spark/spark-${SPARK_VERSION}-bin-hadoop2.6 /opt/spark/default
sudo chown -R ec2-user:ec2-user /opt/spark

echo "spark-$SPARK_VERSION installation complete."
