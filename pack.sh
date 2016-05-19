#!/bin/bash -eux
vagrant destroy -f
rm -f *.box
vagrant box update
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-triggers
vagrant up

sleep 10
vagrant halt

export BOX="dev-basebox"
export BOX_VER="$(vagrant box list | grep "ubuntu/xenial64" | tail -1 | awk '{print $3}' | sed 's/)//g')"
export BOX_FILE="${HOME}/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-xenial64/${BOX_VER}/virtualbox/Vagrantfile"
cat ${BOX_FILE} | sed 's/ubuntu-xenial-16.04-cloudimg/dev-basebox/g' | tee Vagrantfile.box
vagrant package ubuntu --output ${BOX}.box --vagrantfile Vagrantfile.box && vagrant box add ${BOX}.box --name ${BOX} --force && rm -f ${BOX}.box && rm *.log
