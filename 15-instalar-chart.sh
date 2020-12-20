#/bin/sh
# De:
# Em: 20/12/20

helm lint web-src/
helm push web-src/ local
helm repo update
