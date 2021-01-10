#!/bin/sh
# De: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
# Em: 17/12/20

# Definindo cidr que será usado pelo Flannel que é um pod network add-on 
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
