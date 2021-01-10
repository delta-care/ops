#!/bin/sh
# De: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
# De: https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
# Em: 17/12/20

# instalar dashboard (aplicar o seu deplyment e outros recursos necessários)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# definir porta pública ao deployment do dashboard
#   obter o id do pod do dashboard 
#kubectl get pods -n kubernetes-dashboard
#   obter a porta do pod/image do kubernetes-dashboard e definir em --target-port do comando expose abaixo
#kubectl describe pod/<id-pod-kube-dash> -n kubernetes-dashboard
kubectl expose deployment kubernetes-dashboard --name=kubernetes-dashboard-nodeport --target-port=8443 --port=443 --type=NodePort -n kubernetes-dashboard

# obter token para acessar o dashboard
# criar o service account
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# criar o cluster role binding
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# obter o token
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

# obter a porta exposta do recurso nodeport 
kubectl get service -n kubernetes-dashboard

# abrir tal porta da máquina

# acessar o dashboard via browser e informar o token gerado acima
#https://<ip-da-maquina>:<porta>
