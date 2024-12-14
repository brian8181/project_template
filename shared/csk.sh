#!/bin/bash

# File Name:  csk.sh
# Build Date: Sat Dec 14 09:24:01 AM CST 2024
# Version:    0.0.1
# Info: create skeleton, helper script runs skel.sh

USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
APP_NAME=$1
TEMPLATE_NAME=$2
LICENSE=$3

~/bin/skel.sh ${APP_NAME} ${TEMPLATE_NAME}
