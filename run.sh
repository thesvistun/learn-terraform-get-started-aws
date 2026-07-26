#!/usr/bin/env bash

export TF_VAR_user_ip=$(curl -s https://api.myip.com | jq -r .ip)

docker run -it --rm \
  -u $(id -u):$(id -g) \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_REGION \
  -e TF_VAR_user_ip \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  hashicorp/terraform:1.15 "$@"