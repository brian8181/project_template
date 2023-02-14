#!/bin/bash
FILE='./install.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
AUTHOR='Brian K Preston'
EMAIL='brain1818@gmail.com'
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
# remove "project_templates" before update
rm -rf ~/bin/project_templates
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
chmod +x ~/bin/csk.sh  
chmod +x ~/bin/skel.sh

# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk

PRINT_INFO "remove existing class templates ..."
# remove old scripts
rm ~/bin/ccl 2>/dev/null                   # possible error
rm ~/bin/ccl2 2>/dev/null                  # possible error
rm ~/bin/create.class.sh 2> /dev/null      # possible error
rm ~/bin/run.create.class.sh 2> /dev/null  # possible error
rm ~/bin/class.?pp.tmpl 2> /dev/null       # possible error
rm ~/bin/class.base.?pp.tmpl 2> /dev/null  # possible error
# rm whole! class template folder
rm -rf ~/bin/class_tmpl 2> /dev/null

PRINT_INFO "install class templates ..."
PRINT_INFO "copy scripts"
# copy whole class template directory to bin
cp -rf ./class_tmpl ~/bin #2> /dev/null
# copy class templates to bin
cp -f ./class_tmpl/*.sh ~/bin
cp -f ./class_tmpl/*.tmpl ~/bin

PRINT_INFO "create easy name soft link"
ln -s ~/bin/class_tmpl/create.class.sh ~/bin/ccl
# create new link with multi name option built into script
ln -s ~/bin/class_tmpl/run.create.class.sh ~/bin/ccl2

##{ END CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
