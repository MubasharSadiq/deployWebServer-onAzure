#!/bin/bash

# Update the package list to ensure you have the latest information on available packages
sudo apt-get update

# Install Nginx web server
sudo apt-get install -y nginx

# Start the Nginx service to begin serving web content
sudo systemctl start nginx

# Enable Nginx to start automatically on system boot
sudo systemctl enable nginx
