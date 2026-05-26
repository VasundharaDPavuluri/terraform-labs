#!/bin/bash

# Update Packages
yum update -y

# Install NGINX
yum install nginx -y

# Start NGINX
systemctl start nginx

# Enable NGINX
systemctl enable nginx

# Create Web Page
echo "<h1>Project-15 Multi-AZ Production Infrastructure</h1>" > /usr/share/nginx/html/index.html

# IMDSv2 Token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)

# Fetch Instance ID
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
-s http://169.254.169.254/latest/meta-data/instance-id)

# Add Instance ID to Web Page
echo "<h2>Instance ID: $INSTANCE_ID</h2>" >> /usr/share/nginx/html/index.html