#!/bin/bash

APP_NAME=$1
TEMPLATE_NAME=$2

# TEMPLATE_PATH=$3 # Deduced from name!
# PROJECT_PATH=$4  # Deduced from pwd!

# defaults
USER_ROOT="/home/brian"
SRC_ROOT="${USER_ROOT}/src"
BIN="${USER_ROOT}/bin"
TMP="$USER_ROOT/tmp"
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="${BIN}/project_templates/basic"
DEFAULT_PROJECT_PATH="${USER_ROOT}/tmp"

${BIN}/project_templates/basic/skel.sh ${APP_NAME:-$DEFAULT_APP_NAME} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH}