#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
# Need to comment out below because running a web server in remote-exec causes EC2 to be stuck in "Still Creating...""
# docker run -p 8080:80 nginx
