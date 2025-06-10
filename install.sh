#!/usr/bin/bash

# File Name:  ./install.sh
# Build Date: Wed Sep 25 11:00:12 PM CDT 2024
# Version:    0.1.0

FILE='./install.sh'
VERSION='0.2.0'
FILE_DATE='Mon Dec 23 12:53:57 PM CST 2024'

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

PRINT_INFO "Installing templates, ..."
PRINT_INFO "remove existing project templates ..."

# disable debug
set +x
# disable echo 
set +v
# remove "templates" before update
rm -rf ~/bin/templates > /dev/null
rm ~/bin/csk.sh
rm ~/bin/csk
rm ~/bin/ccsk.sh
rm ~/bin/ccsk

PRINT_INFO "copying project templates ..."
cp -r ./templates ~/bin/templates
cp ./script/* ~/bin

PRINT_INFO "set permissions ..."
chmod +x ~/bin/csk.sh
chmod +x ~/bin/ccsk.sh

PRINT_INFO "create links (csk & ccsk) ..."
# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk
ln -s ~/bin/ccsk.sh ~/bin/ccsk

PRINT_INFO "done."
