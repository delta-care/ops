#/bin/sh
# De: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
# De: https://github.com/coreos/flannel
# Em: 17/12/20

# instalar pod network add-on
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
