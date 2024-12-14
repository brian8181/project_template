#!/usr/bin/bash

# File Name:  ./install.sh
# Build Date: Wed Sep 25 11:00:12 PM CDT 2024
# Version:    0.1.0

FILE='./install.sh'
VERSION='0.1.1'
FILE_DATE='Thu Aug 15 10:17:45 PM CDT 2024'

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

CWD=$PWD
PRINT_INFO "Installing templates, ..."
PRINT_INFO "remove existing project templates ..."
# remove "templates" before update
rm -rf ~/bin/project_templates

PRINT_INFO "copying project templates ..."
cp -r ./shared ~/bin
cp -r ./templates ~/bin/project_templates

PRINT_INFO "set permissions ..."
chmod +x ~/bin/skel.sh

PRINT_INFO "create links (csk) ..."
rm ~/bin/csk
# create easy name soft link
ln -s ~/bin/skel.sh ~/bin/csk

PRINT_INFO "done."
