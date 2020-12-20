#!/bin/sh
# De: https://artifacthub.io/packages/helm/chartmuseum/chartmuseum
# Em: 20/12/20

helm install chartmuseum -f 13-instalar-chartmuseum-conf.yaml stable/chartmuseum --namespace ops
