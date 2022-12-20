#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

helm upgrade redis bitnami/redis \
  --install \
  --namespace elk-dev \
  --create-namespace \
  --values .infrastructure/other/cache-values.yaml

