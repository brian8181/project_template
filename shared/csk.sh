#!/bin/bash

FILE='./shared/csk.sh'
FILE_DATE='Mon Jul 22 11:47:09 AM CDT 2024'
BUILD_DATE=$(date)
VERSION="3.6.7"

APP_NAME=$1
TEMPLATE_NAME=$2
LICENSE=$3

~/bin/skel.sh "${APP_NAME}" "${TEMPLATE_NAME}" "${LICENSE:=GPL}" "" "${FILE_DATE}" "${VERSION}" "${BUILD_DATE}"
