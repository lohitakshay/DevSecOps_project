#!/bin/bash

# Update package list
sudo apt-get update

# Install dependencies
sudo apt-get install -y software-properties-common

# Add Grafana APT repository
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

# Install Grafana
sudo apt-get update
sudo apt-get install -y grafana

# Start and enable Grafana service
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Grafana installation completed."

