#!/bin/bash
FILE='./test/ah.sh'
VERSION='6.6.6'
FILE_DATE='March 8, 2023'
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
VERBOSE=0
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
##{ BEGIN YOUR CODE  }##

# ! UNSUSED PARAMATERS !#
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
# command line params
TEST_FILE=$1
APP_NAME=$2
TEMPLATE_NAME=$3
LICENSE=$4
AUTHOR="MyName"
BUILD_DATE=$(date)
VERSION="3.6.7"

echo "HERE ..."

./add_headers.sh "${TEST_FILE:=test.hpp.tmpl}" "${APP_NAME:=ABC}" "${TEMPLATE_NAME:=basic}" "${LICENSE:=GPL}" "${AUTHOR:=bob}" "${BUILD_DATE:=2023}" "${VERSION:=01}"

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting... @ $DATE"
