#!/bin/bash

# Update package list and install dependencies
sudo apt-get update
sudo apt-get install -y wget tar

# Define Prometheus version
PROMETHEUS_VERSION="2.43.0"

# Download Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Extract the downloaded tar file
tar xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Move the binaries to /usr/local/bin
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/

# Move the configuration file and console libraries
sudo mkdir /etc/prometheus
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus.yml /etc/prometheus/

# Create a systemd service file for Prometheus
cat <<EOL | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Monitoring System
After=network.target

[Service]
ExecStart=/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd and start Prometheus
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Cleanup
rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64
rm prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

echo "Prometheus installation completed."

