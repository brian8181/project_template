#!/bin/bash
FILE='./shared/csk.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

# USER SETTING
DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1
# END

if [ -n $VERBOSE ]
then
	echo ${VERBOSE:+"File - $FILE"}
	echo ${VERBOSE:+"Version - $VERSION"}
	echo ${VERBOSE:+"Date - $FILE_DATE"}
	echo ${VERBOSE:+"Author - $AUTHOR"}
	echo ${VERBOSE:+"Email - $EMAIL"}
	echo ${VERBOSE:+"www - $WWW"}
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
# DEBUG
PRINT_DEBUG "$FILE -> Running... @ $DATE"

##{ BEGIN YOUR CODE  }##

USER_NAME=brian # from config
APP_NAME=$1
TEMPLATE_NAME=$2
TEST_DEBUG1=$3
TEST_DEBUG2=$4


# defaults
USER_ROOT="/home/${USER_NAME}"
SRC_ROOT="${USER_ROOT}/src"
BIN="${USER_ROOT}/bin"
TMP="$USER_ROOT/tmp"
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="${BIN}/project_templates/basic"
DEFAULT_PROJECT_PATH="${USER_ROOT}/tmp"

echo USER_NAME = $USER_NAME
echo APP_NAME = $APP_NAME
echo TEMPLATE_NAME = $TEMPLATE_NAME
echo TEST_DEBUG1 = $TEST_DEBUG1
echo TEST_DEBUG2 = $TEST_DEBUG2

echo COMMAND : ${APP_NAME:-$DEFAULT_APP_NAME} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH}

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting... @ $DATE"
# DEBUG
PRINT_DEBUG "$FILE -> Exiting... @ $DATE"
