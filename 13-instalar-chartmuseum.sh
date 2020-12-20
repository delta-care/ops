#!/bin/sh
# De: https://artifacthub.io/packages/helm/chartmuseum/chartmuseum
# Em: 20/12/20

helm install chartmuseum -f 13-instalar-chartmuseum-conf.yaml stable/chartmuseum --namespace ops
#export NODE_PORT=$(kubectl get --namespace ops -o jsonpath="{.spec.ports[0].nodePort}" services chartmuseum-chartmuseum)
#export NODE_IP=$(kubectl get nodes --namespace ops -o jsonpath="{.items[0].status.addresses[0].address}")
#helm repo add local http://$NODE_IP:$NODE_PORT/
