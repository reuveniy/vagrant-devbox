#!/bin/bash -eux
echo "127.0.0.1 ubuntu-xenial" | sudo tee -a /etc/hosts
#sudo apt-get install virtualbox-guest-dkms git vagrant curl -y
sudo apt-get install vagrant -y
curl -fsSL https://get.docker.com/ | sh

#replace public key
mkdir -p ~/.ssh
chmod 0700 ~/.ssh
wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
chown -R ubuntu ~/.ssh