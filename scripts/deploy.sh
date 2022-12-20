#!/bin/bash

set -e

kind create cluster --name elk-cluster-test --config .infrastructure/other/kind-config.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

