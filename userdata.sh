#!/bin/bash
yum update -y
yum install nginx -y
yum install git -y
systemctl start nginx
systemctl enable nginx
systemctl restart nginx