#!/bin/bash

yum update -y

yum install nginx -y

systemctl start nginx

systemctl enable nginx

echo "<h1>Project-14 ALB + ASG Infrastructure</h1>" > /usr/share/nginx/html/index.html

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
-s http://169.254.169.254/latest/meta-data/instance-id)

echo "<h2>Instance ID: $INSTANCE_ID</h2>" >> /usr/share/nginx/html/index.html