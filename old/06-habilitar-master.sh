#/bin/sh
# De: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
# De: https://github.com/coreos/flannel
# Em: 17/12/20

# habilitar gestão de pod no node control-plane (recomendado somente para ambiente de dev)
kubectl taint nodes --all node-role.kubernetes.io/master-

