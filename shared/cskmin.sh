#!/bin/bash

FILE='./shared/csk.sh'
FILE_DATE=$(date)
BUILD_DATE=$(date)
VERSION="3.6.7"
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"

APP_NAME=$1
TEMPLATE_NAME=minimal
LICENSE=$3

~/bin/skel.sh "${APP_NAME}" "${TEMPLATE_NAME}" "" "" "${FILE_DATE}" "${VERSION}" "${BUILD_DATE}"
