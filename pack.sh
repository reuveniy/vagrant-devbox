#!/bin/bash -eux
vagrant destroy -f
rm -f *.box
vagrant box update
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-vbguest
vagrant up
sleep 10
vagrant halt

box=dev-basebox 
vagrant package ubuntu --output ${box}.box && vagrant box add ${box}.box --name ${box} --force && rm -f ${box}.box
rm *.log