#!/bin/bash
FILE='install2.sh'
VERSION='0.1'
FILE_DATE='1172022'

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
rm ~/bin/skel.sh  > /dev/null # possible error
rm ~/bin/csk.sh > /dev/null   # possible error
rm ~/bin/csk > /dev/null      # possible error

PRINT_INFO "install project scripts ..."
# copy scripts
cp -rf ./shared/* ~/bin
cp -f ./shared/csk.sh ~/bin/csk.sh
chmod +x ~/bin/csk.sh  
chmod +x ~/bin/skel.sh

# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk

PRINT_INFO "remove existing class templates ..."
# remove old scripts
rm ~/bin/ccl 
rm ~/bin/ccl2
rm ~/bin/create.class.sh
rm ~/bin/run.create.class.sh
rm ~/bin/class.?pp.tmpl
#rm ~/bin/ccl ~/bin/ccl2 ~/bin/create.class.sh ~/bin/class.?pp.tmpl

PRINT_INFO "install class templates ..."
PRINT_INFO "copy scripts"
cp -f ./class_tmpl/*.sh ~/bin
cp -f ./class_tmpl/*.tmpl ~/bin
PRINT_INFO "create easy name soft link"
ln -s ~/bin/create.class.sh ~/bin/ccl
# create new link with multi name option built into script
ln -s ~/bin/run.create.class.sh ~/bin/ccl2

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
