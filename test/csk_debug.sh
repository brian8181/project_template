#!/bin/bash
FILE='./shared/cskd.sh'
<<<<<<< HEAD:shared/csk_debug.sh
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
=======
VERSION='0.1.6'
FILE_DATE='March 8, 2023'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778:test/csk_debug.sh

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1

if [ -n $VERBOSE ]
then
	echo ${VERBOSE:+"File - $FILE"}
	echo ${VERBOSE:+"Version - $VERSION"}
	echo ${VERBOSE:+"Date - $FILE_DATE"}
fi

function PRINT_DEBUG
{
    MSG=${DEBUG_MSG}$1
    echo -e ${DEBUG:+"$MSG"}
}

function PRINT_INFO
{
    MSG=${INFO_MSG}$1
    echo -e ${VERBOSE:+"$MSG"}
}

PRINT_INFO "$FILE -> Running... @ $DATE"
<<<<<<< HEAD:shared/csk_debug.sh

##{ BEGIN CODE }##
=======
# DEBUG
PRINT_DEBUG "$FILE -> Running... @ $DATE"
##{ BEGIN YOUR CODE  }##
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778:test/csk_debug.sh

USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
# command line params
APP_NAME=$1
TEMPLATE_NAME=$2
TEST_DEBUG1=$3
TEST_DEBUG2=$4

SRC_ROOT="${USER_ROOT}/src"
BIN="${USER_ROOT}/bin"
TMP="{$USER_ROOT}/tmp"
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="${BIN}/project_templates/basic"
DEFAULT_PROJECT_PATH="${USER_ROOT}/tmp"
TEMPLATE_PATH="${BIN}/project_templates/${TEMPLATE_NAME}"
CLASS_TEMPLATE_PATH="${BIN}/class_tmpl"

echo "USER_NAME : $USER_NAME"
echo "APP_NAME : $APP_NAME"
echo "USER_ROOT : $USER_ROOT"
echo "SRC_ROOT : $SRC_ROOT"
echo "TEMPLATE_NAME : $TEMPLATE_NAME"
echo "TEMPLATE_PATH : $TEMPLATE_PATH"
echo "CLASS_TEMPLATE_PATH : $CLASS_TEMPLATE_PATH"
echo "TEST_DEBUG1 : $TEST_DEBUG1"
echo "TEST_DEBUG2 : $TEST_DEBUG2"

echo COMMAND : ${APP_NAME:-$DEFAULT_APP_NAME} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} 

<<<<<<< HEAD:shared/csk_debug.sh
##{ END CODE }##

=======
##{ END YOUR CODE  }##
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778:test/csk_debug.sh
PRINT_INFO "$FILE -> Exiting... @ $DATE"
