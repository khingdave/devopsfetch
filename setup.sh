#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install -y nginx docker.io

# Create systemd service
echo "[Unit]
Description=DevOpsFetch Monitoring Service
After=network.target

[Service]
ExecStart=$(pwd)/devopsfetch.sh -l
Restart=always

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/devopsfetch.service

# Enable and start the service
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

# Log rotation setup
echo "/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 root root
}" | sudo tee /etc/logrotate.d/devopsfetch

