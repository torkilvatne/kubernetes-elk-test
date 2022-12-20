#!/bin/bash

docker build -t image-test:$1 .
kind load docker-image image-test:$1 --name elk-cluster-test 

cd .infrastructure/kubernetes/backend

kustomize edit set image image-test=image-test:$1

kustomize build | kubectl apply -f -

kubectl apply -f .infrastructure/other/statefulset.yaml

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

