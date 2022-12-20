#!/bin/bash

# Add installation of all pods here
cd ./filebeat
helm upgrade filebeat . \
  --install \
  --values values.yaml

cd ../logstash
helm upgrade logstash . \
  --install \
  --values values.yaml

cd ../elasticsearch
helm upgrade elasticsearch . \
  --install \
  --values values.yaml

# cd ../kibana
# helm upgrade kibana . \
#   --install \
#   --values values.yaml