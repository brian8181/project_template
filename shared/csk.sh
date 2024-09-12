#!/bin/bash

FILE='./shared/csk.sh'
<<<<<<< HEAD
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=0
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

##{ BEGIN CODE }##

USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
=======
FILE_DATE='Mon Jul 22 11:47:09 AM CDT 2024'
BUILD_DATE=$(date)
VERSION="3.6.7"

>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
APP_NAME=$1
TEMPLATE_NAME=$2
LICENSE=$3

<<<<<<< HEAD
~/bin/skel.sh ${APP_NAME} ${TEMPLATE_NAME}

##{ END CODE }##

PRINT_INFO "$FILE -> Exiting... @ $DATE"
=======
~/bin/skel.sh "${APP_NAME}" "${TEMPLATE_NAME}" "${LICENSE:=GPL}" "" "${FILE_DATE}" "${VERSION}" "${BUILD_DATE}"
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
