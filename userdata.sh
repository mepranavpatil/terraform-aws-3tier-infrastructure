#!/bin/bash

dnf update -y
dnf install nginx -y


systemctl start nginx
systemctl enable nginx
systemctl restart nginx
echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html