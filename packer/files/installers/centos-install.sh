#!/bin/bash

set -e

echo "Updating package info..."
sudo yum update -y -q -e 0

echo "Upgrading packages..."
sudo yum upgrade -y -q -e 0
