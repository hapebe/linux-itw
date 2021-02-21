#!/bin/bash
#
# source ./raspi-env.sh before his!
#
openssl pkcs12 -in $1 -info -nodes -passin pass:$certPass -passout pass:$certPass | openssl x509 -text
