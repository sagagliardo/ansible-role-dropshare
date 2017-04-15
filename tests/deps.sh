#!/bin/bash
set -e

TRAVIS_CACHE_DIR="${HOME}/bin"
### Get Terraform
PACKER_URL="https://releases.hashicorp.com/terraform/0.9.3/terraform_0.9.3_linux_amd64.zip"

if [ ! -f "${TRAVIS_CACHE_DIR}/terraform" ]; then
  wget -O /tmp/terraform.zip "${PACKER_URL}"
  unzip -d "${TRAVIS_CACHE_DIR}" /tmp/terraform.zip
fi

terraform version
