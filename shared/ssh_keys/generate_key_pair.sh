#!/bin/bash

KEY_PATH="shared/ssh_keys"
KEY_NAME=$1
EXISTING_KEY=$2

PRIVATE_KEY_PATH="${KEY_PATH}/${KEY_NAME}.pem"
PUBLIC_KEY_PATH="${KEY_PATH}/${KEY_NAME}.pub"

[ ! -d "${KEY_PATH}" ] && {
  echo -e "Directory [${KEY_PATH}] does not exist. This script must be run from the 'consul-cluster' directory." ; exit 1
}

[ -z "${1}" ] && {
  echo -e "A key name must be passed as the first argument." ; exit 1
}

[ -s "${PRIVATE_KEY_PATH}" ] && [ -s "${PUBLIC_KEY_PATH}" ] && [ -z "${EXISTING_KEY}" ] && {
    echo -e "Using existing key pair."
} || {
  [ "${KEY_PATH}/${KEY_NAME}" = '/' ] && exit 1 # fail safe

  rm -rf $KEY_PATH/$KEY_NAME*

  [ -z "${EXISTING_KEY}" ] && {
    echo -e "No key pair exists and no private key arg was passed, generating new keys."
    openssl genrsa -out $PRIVATE_KEY_PATH 1024
    chmod 700 $PRIVATE_KEY_PATH
    ssh-keygen -y -f $PRIVATE_KEY_PATH > $PUBLIC_KEY_PATH
    chmod 700 $PUBLIC_KEY_PATH
  } || {
    echo -e "Using private key [${EXISTING_KEY}] for key pair."
    cp $EXISTING_KEY $PRIVATE_KEY_PATH
    chmod 700 $PRIVATE_KEY_PATH
    ssh-keygen -y -f $PRIVATE_KEY_PATH > $PUBLIC_KEY_PATH
    chmod 700 $PUBLIC_KEY_PATH
  }
}

echo ""
echo -e "Public key:  ${PUBLIC_KEY_PATH}"
echo -e "Private key: ${PRIVATE_KEY_PATH}"
echo ""
