#! /bin/sh

# set dependencies: env vars and module
# https://docs.ansible.com/ansible/2.5/user_guide/intro_dynamic_inventory.html#example-aws-ec2-external-inventory-script
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
pip install boto3
pip install botocore

# install packages
ansible-inventory -i ./ansible/inventory/aws_ec2.yaml --graph
ansible-playbook -v -u ubuntu -i ./ansible/inventory/aws_ec2.yaml ./ansible/main.yml
