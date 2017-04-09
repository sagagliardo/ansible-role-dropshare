#!/bin/bash
set -e

CIRCLECI_CACHE_DIR="${HOME}/bin"
### Get Terraform
PACKER_URL="https://releases.hashicorp.com/terraform/0.9.1/terraform_0.9.1_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/terraform" ]; then
  wget -O /tmp/terraform.zip "${PACKER_URL}"
  unzip -d "${CIRCLECI_CACHE_DIR}" /tmp/terraform.zip
fi

terraform version

### Get pip installer script

PIP_URL="https://bootstrap.pypa.io/get-pip.py"

if [ ! -f "${CIRCLECI_CACHE_DIR}/get-pip.py" ]; then
  wget -O "${CIRCLECI_CACHE_DIR}/get-pip.py" "${PIP_URL}"
fi

DEGOSS_URL="https://github.com/sagagliardo/ansible-role-degoss/archive/directories_fix.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/roles/ansible-role-degoss-directories-fix" ]; then
  wget -O /tmp/degoss.zip "${DEGOSS_URL}"
  unzip -d "${CIRCLECI_CACHE_DIR}/roles" /tmp/degoss.zip
fi
