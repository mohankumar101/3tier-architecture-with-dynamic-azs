#!/bin/bash
# install webserver(http)
apt-get update -y
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Echo from 3 tier architecture - webtier - $(hostname -f)</h1>" > /var/www/html/index.html