#!/bin/bash

# File Name:  ./install.sh
# Build Date: Sat, Sep 20, 2025  9:52:45 PM
# Version:    0.0.1

FILE='./install.sh'
VERSION='0.0.1'
FILE_DATE='Sat, Sep 20, 2025  9:52:45 PM'

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

PRINT_INFO "$FILE -> Running ... @ $DATE"

DIR=$(dirname "$0")
NAME=$(basename "$0")

if [[ "$DIR" != "." && "NAME" != "install.sh" ]]; then
    PRINT_DEBUG "Error: must be run from project directory ..."
    PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"
    exit -1
fi

# install
PRINT_INFO "Installing scripts ..."

# unintsall before existing files
./uninstall.sh

PRINT_INFO "copying project templates ..."
mkdir -p "${HOME}/.config/csk"
# install to .config
cp src/*.php "${HOME}/.config/csk"
#  install to local bin
cp "src/csk.sh" "${HOME}/bin/"
cp "src/ccsk.sh" "${HOME}/bin/"

PRINT_INFO "set permissions ..."
# set exe perm just in case
chmod +x "${HOME}/bin/csk.sh"
chmod +x "${HOME}/bin/ccsk.sh"
chmod +x "${HOME}"/.config/csk/*.php

PRINT_INFO "create links (csk & ccsk) ..."
# create easy name soft link
ln -s "${HOME}/bin/csk.sh" "${HOME}/bin/csk"
ln -s "${HOME}/bin/ccsk.sh" "${HOME}/bin/ccsk"
PRINT_INFO "Finished installing."
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
