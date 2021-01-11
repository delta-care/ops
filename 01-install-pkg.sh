#! /bin/sh

# install terraform 
# https://www.terraform.io/docs/cli/install/apt.html
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform=0.14.4

# install ansible
# https://docs.ansible.com/ansible/2.5/installation_guide/intro_installation.html
sudo apt-get install python-pip python-dev
sudo -H pip install ansible==2.10.4