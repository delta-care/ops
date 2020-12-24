#!/bin/sh
# De: https://www.jenkins.io/doc/book/installing/kubernetes/
# Em: 20/12/20

kubectl create -f 16-instalar-jenkins.yaml -n ops

# configurar kubernetes no jenkins https://youtu.be/OfoAYVi1YcU?t=243
# instalar plugin Pipeline Utility Steps
