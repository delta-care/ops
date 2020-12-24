#!/bin/sh
# De: https://doc.traefik.io/traefik/v1.7/user-guide/kubernetes/
# Em: 23/12/20

# instalar permissões
kubectl apply -f 18-traefik-rbac.yaml

# instalar daemonset
kubectl apply -f 18-traefik-daemon.yaml

# instalar ui
kubectl apply -f 18-traefik-ui.yaml
