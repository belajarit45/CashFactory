#!/bin/bash
#######################################################################
# File name : setup.sh 
# Author : Olivier Galand (31/12/2021)
# Author email : galand.olivier.david@gmail.com
# Project : CashFactory
# Project repository : https://github.com/OlivierGaland/CashFactory
# 
# Setup script for docker environment
#######################################################################

# install and setup docker on the host, the following command will need a sudo to correctly run : sudo ./setup.sh
# Update repository
apk update

# Install necessary packages
apk add --no-cache ca-certificates curl gnupg lsb-release git

# Download Docker GPG key
curl -fsSL https://download.docker.com/linux/alpine/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=$(apk --print-arch) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/alpine $(lsb_release -cs) stable" | sudo tee /etc/apk/repositories > /dev/null

# Update repository again
apk update

# Install Docker
apk add --no-cache docker docker-cli containerd

# Start Docker service
rc-update add docker boot
/etc/init.d/docker start

# Install Docker Compose
apk add --no-cache docker-compose

mkdir -p data/bitping #create data directory for bitping credentials


