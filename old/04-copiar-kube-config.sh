#!/bin/sh
# De: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
# Em: 17/12/20

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
