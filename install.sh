#!/usr/bin/bash

# License:    None
# File Name:  ./install.sh
# Build Date: Sun May 26 10:57:08 PM CDT 2024
# Version:    0.1.0

FILE='./install.sh'
<<<<<<< HEAD
VERSION='0.1.1'
FILE_DATE='Thu Aug 15 10:17:45 PM CDT 2024'
=======
VERSION='0.1.7'
FILE_DATE='Tue Sep 12 09:50:26 AM CDT 2023'
FILE_DATE='Tue Nov 14 03:34:38 AM CDT 2023'
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778

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
<<<<<<< HEAD
##{ BEGIN CODE  }##

=======
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
PRINT_INFO "remove existing project templates ..."
# remove "templates" before update
rm -rf ~/bin/templates
PRINT_INFO "install project templates ..."
# copy templates
<<<<<<< HEAD
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
=======
mkdir ~/bin/templates
cp -r ./templates/basic ~/bin/templates
cp -r ./templates/basic_nam ~/bin/templates
cp -r ./templates/minimal ~/bin/templates
cp -r ./templates/gtk ~/bin/templates
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778

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
<<<<<<< HEAD
ln -s ~/bin/class_tmpl/run.create.class.sh ~/bin/ccl2

##{ END CODE  }##
=======
ln -s ~/bin/run.create.class.sh ~/bin/ccl2

>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
