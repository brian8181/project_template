#!/bin/bash
FILE='{FILE}'
VERSION='{VERSION}'
FILE_DATE='{DATE}'
# AUTHOR='{AUTHOR}'
# EMAIL='{EMAIL}'
# WWW='{WWW}'

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
	echo ${VERBOSE:+"File - $FILE"}.
	echo ${VERBOSE:+"Version - $VERSION"}.
	echo ${VERBOSE:+"Date - $FILE_DATE"}.
	# echo ${VERBOSE:+"Author - $AUTHOR"}.
	# echo ${VERBOSE:+"Email - $EMAIL"}.
	# echo ${VERBOSE:+"www - $WWW"}.
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

USER_NAME=brian
APP_NAME=$1
TEMPLATE_NAME=$2

# defaults
USER_ROOT="/home/${USER_NAME}"
SRC_ROOT="${USER_ROOT}/src"
BIN="${USER_ROOT}/bin"
TMP="$USER_ROOT/tmp"
DEFAULT_APP_NAME='NoName'
DEFAULT_TEMPLATE_PATH="${BIN}/project_templates/basic"
DEFAULT_PROJECT_PATH="${USER_ROOT}/tmp"

~/bin/skel.sh ${APP_NAME:-$DEFAULT_APP_NAME} ${TEMPLATE_PATH:-$DEFAULT_TEMPLATE_PATH} ${PROJECT_PATH:-$DEFAULT_PROJECT_PATH}

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
