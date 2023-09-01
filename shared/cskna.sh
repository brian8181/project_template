#!/bin/bash

FILE='./shared/csk.sh'
VERSION='0.1.6'
FILE_DATE='March 8, 2023'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'
BUILD_DATE=$(date)
VERSION="0.0.1"

USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
# command line params
APP_NAME=$1
TEMPLATE_NAME=$2
LICENSE=$3

~/bin/skel_no_auto.sh "${APP_NAME}" "${TEMPLATE_NAME}" "${LICENSE:=GPL}" "${AUTHOR}" "${BUILD_DATE}" "${VERSION}" "${BUILD_DATE}"
