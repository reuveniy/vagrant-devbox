#!/bin/bash -eux
USER="vagrant"; HOME="/home/${USER}"; SSH_HOME="${HOME}/.ssh"

echo "127.0.0.1 $(hostname)" | sudo tee -a /etc/hosts
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install vagrant -y
curl -fsSL https://get.docker.com/ | sudo sh
sudo docker pull registry:2