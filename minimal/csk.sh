#!/bin/bash
VERSION='0.1'
FILE_DATE='January 2, 2023'

USER_NAME=brian
APP_NAME=$1
TEMPLATE_NAME=$2

# defaults
USER_ROOT="/home/${USER_NAME}"
SRC_ROOT="${USER_ROOT}/src"
BIN="${USER_ROOT}/bin"
TMP="$USER_ROOT/tmp"
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="${BIN}/project_templates/minimal"
DEFAULT_PROJECT_PATH="${USER_ROOT}/tmp"

~/bin/skel.sh ${APP_NAME:-$DEFAULT_APP_NAME} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH}