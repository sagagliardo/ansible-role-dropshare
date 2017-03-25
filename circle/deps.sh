#!/bin/bash
set -e

CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_URL="https://releases.hashicorp.com/terraform/0.9.1/terraform_0.9.1_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/terraform" ]; then
  wget -O /tmp/terraform.zip "${PACKER_URL}"
  unzip -d "${CIRCLECI_CACHE_DIR}" /tmp/terraform.zip
fi

terraform version
