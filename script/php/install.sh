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

mkdir -p ~/bin/skel
PRINT_INFO "copying project templates ..."
cp src/*.php ~/bin/skel
cp src/_*csk.sh ~/bin/skel
cp src/gitignore.php ~/bin/skel

PRINT_INFO "set permissions ..."
chmod +x ~/bin/skel/*csk.sh
chmod +x ~/bin/skel/*.php

PRINT_INFO "create links (csk_ & ccsk_) ..."
# create easy name soft link
ln -s ~/bin/skel/_csk.sh ~/bin/csk_
ln -s ~/bin/skel/_ccsk.sh ~/bin/ccsk_
PRINT_INFO "Finished installing."
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
