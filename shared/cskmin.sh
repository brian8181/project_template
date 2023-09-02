#!/bin/bash

FILE='./shared/csk.sh'
FILE_DATE=$(date)
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'
BUILD_DATE=$(date)
VERSION="3.6.7"
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"

APP_NAME=$1
TEMPLATE_NAME=minamal
LICENSE=$3

~/bin/skel.sh "${APP_NAME}" "${TEMPLATE_NAME}" "${LICENSE:=GPL}" "${AUTHOR}" "${FILE_DATE}" "${VERSION}" "${BUILD_DATE}"
