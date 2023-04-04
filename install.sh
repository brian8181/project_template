#!/bin/bash
FILE='./install.sh'
VERSION='0.1.6'
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
##{ BEGIN CODE  }##

PRINT_INFO "remove existing project templates ..."
# remove "templates" before update
rm -rf ~/bin/templates
PRINT_INFO "install project templates ..."
# copy templates
mkdir ~/bin/templates
cp -r ./templates/basic ~/bin/templates
cp -r ./templates/minimal ~/bin/templates
cp -r ./templates/gtk ~/bin/templates

PRINT_INFO "remove existing project scripts ..."
# remove old scripts & links
rm ~/bin/skel.sh  2> /dev/null             # possible error
rm ~/bin/csk.sh 2> /dev/null               # possible error
rm ~/bin/csk 2> /dev/null                  # possible error

PRINT_INFO "remove existing class templates ..."
# remove old scripts
rm ~/bin/ccl 2>/dev/null                   # possible error
rm ~/bin/ccl2 2>/dev/null                  # possible error
rm ~/bin/create.class.sh 2> /dev/null      # possible error
rm ~/bin/run.create.class.sh 2> /dev/null  # possible error
rm ~/bin/run.defaults.create.class.sh 2> /dev/null  # possible error
rm ~/bin/class.*.tmpl 2> /dev/null         # possible error

PRINT_INFO "install project scripts ..."
PRINT_INFO "install class templates ..."
# copy scripts
cp -r ./shared/* ~/bin
# config
chmod +x ~/bin/csk.sh  
chmod +x ~/bin/skel.sh
chmod +x ~/bin/create.class.sh
chmod +x ~/bin/run.create.class.sh
chmod +x ~/bin/run.defaults.create.class.sh 

PRINT_INFO "create easy name soft link"
# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk
ln -s ~/bin/run.defaults.create.class.sh ~/bin/ccl # debug testing
# create new link with multi name option built into script
ln -s ~/bin/run.create.class.sh ~/bin/ccl2

##{ END CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
