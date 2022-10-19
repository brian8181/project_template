#!/usr/bin/bash

APP_NAME=$1 
TEMPLATE_PATH=$2
PROJECT_PATH=$3

# defaults
echo ${APP_NAME:='NoName'}
echo ${TEMPLATE_PATH:='/home/brian/src/templates/project_templates/basic'}
echo ${PROJECT_PATH:="/home/brian/src/${APP_NAME}"}

./skel.sh "${APP_NAME}" "${TEMPLATE_PATH}" "${PROJECT_PATH}"