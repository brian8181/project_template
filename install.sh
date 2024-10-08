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

PRINT_INFO "$FILE -> Running... @ $DATE"
##{ BEGIN CODE  }##

PRINT_INFO "remove existing project templates ..."
# remove "templates" before update
rm -rf ~/bin/templates
PRINT_INFO "install project templates ..."
# copy templates
mkdir ~/bin/project_templates
cp -r ./basic ~/bin/project_templates
cp -r ./minimal ~/bin/project_templates
cp -r ./gtk ~/bin/project_templates
cp -r ./shared ~/bin/project_templates

PRINT_INFO "remove existing project scripts ..."
# remove old scripts & links
rm ~/bin/skel.sh  2> /dev/null # possible error
rm ~/bin/csk.sh 2> /dev/null   # possible error
rm ~/bin/csk 2> /dev/null      # possible error

PRINT_INFO "install project scripts ..."
# copy scripts
cp -f ./shared/csk.sh ~/bin/csk.sh
cp -f ./shared/skel.sh ~/bin/skel.sh	

# config
chmod +x ~/bin/csk.sh  
chmod +x ~/bin/skel.sh

# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk
mkdir ~/bin/templates
cp -r ./templates/basic ~/bin/templates
cp -r ./templates/basic_nam ~/bin/templates
cp -r ./templates/minimal ~/bin/templates
cp -r ./templates/gtk ~/bin/templates

PRINT_INFO "remove existing class templates ..."
PRINT_INFO "copy shared files to mbin ..."
cp ./shared/* ~/bin

# config
chmod +x ~/bin/csk.sh
chmod +x ~/bin/csk-a.sh
chmod +x ~/bin/skel*.sh
chmod +x ~/bin/create.class.sh
chmod +x ~/bin/run.create.class.sh
chmod +x ~/bin/run.defaults.create.class.sh

PRINT_INFO "create easy name soft link"
rm -f ~/bin/csk ~/bin/csk-a ~/bin/ccl*
# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk
ln -s ~/bin/csk-a.sh ~/bin/csk-a
ln -s ~/bin/run.defaults.create.class.sh ~/bin/ccl
# create new link with multi name option built into script
ln -s ~/bin/class_tmpl/run.create.class.sh ~/bin/ccl2

##{ END CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
