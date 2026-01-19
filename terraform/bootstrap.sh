#!/bin/bash

set -e 

apt update -y 
apt install -y \
    nginx \
    postgresql \
    redis-server \
    git \
    curl \
    unzip 

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

# systemctl enable nginx postgresql redis-server
# systemctl start nginx postgresql redis-server 
