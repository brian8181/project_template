#!/bin/bash

APP_NAME=$1
TEMPLATE_NAME=$2

# TEMPLATE_PATH=$3 # Deduced from name!
# PROJECT_PATH=$4  # Deduced from pwd!

# defaults
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="/home/brian/src/templates/project_templates/${TEMPLATE_NAME}"
DEFAULT_PROJECT_PATH=$(pwd)

/home/brian/src/templates/project_templates/${TEMPLATE_NAME}/skel.sh ${APP_NAME:-$DEFAULT_APP_NAME} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH/${APP_NAME}}