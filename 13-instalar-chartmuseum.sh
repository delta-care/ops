#!/bin/sh
# De: https://artifacthub.io/packages/helm/chartmuseum/chartmuseum
# Em: 20/12/20

helm repo add chartmuseum https://chartmuseum.github.io/charts
helm install deltacare -f 13-instalar-chartmuseum-conf.yaml chartmuseum/chartmuseum --namespace ops
export NODE_PORT=$(kubectl get --namespace ops -o jsonpath="{.spec.ports[0].nodePort}" services deltacare-chartmuseum)
export NODE_IP=$(kubectl get nodes --namespace ops -o jsonpath="{.items[0].status.addresses[0].address}")
helm repo add deltacare http://$NODE_IP:$NODE_PORT/
