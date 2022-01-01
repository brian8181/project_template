#!/bin/bash
FILE='install.sh'
VERSION='0.0.1'
FILE_DATE='November, 20, 2021'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'

FMT_FG_RED='\e[31m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

# USER SETTING
DEBUG_MSG="$PRINT_RED_DEBUG: "
VERBOSE=1
DEBUG=1
# END

if [ -n $VERBOSE ]
then
	echo ${VERBOSE:+"File - $FILE"}.
	echo ${VERBOSE:+"Version - $VERSION"}.
	echo ${VERBOSE:+"Date - $FILE_DATE"}.
	echo ${VERBOSE:+"Author - $AUTHOR"}.
	echo ${VERBOSE:+"Email - $EMAIL"}.
	echo ${VERBOSE:+"www - $WWW"}.
fi

function PRINT_DEBUG
{
    MSG=${DEBUG_MSG}$1
    echo -e ${DEBUG:+"$MSG"}
}

PRINT_DEBUG "$FILE -> Running... @ $DATE"

##{ BEGIN YOUR CODE  }##

PRINT_DEBUG "remove exsisting project templates ..."
# remove "project_templates" before update
rm -rf ~/bin/project_templates
PRINT_DEBUG "install project templates ..."
# copy templates
mkdir ~/bin/project_templates
cp -r ./basic ~/bin/project_templates
cp -rf ./basic/.* ~/bin/project_templates
cp -r ./minimal ~/bin/project_templates
cp -r ./gtk ~/bin/project_templates


PRINT_DEBUG "remove exsisting project scripts ..."
# remove old scripts
rm ~/bin/skel.sh ~/bin/csk.sh ~/bin/csk
PRINT_DEBUG "install exsisting project scripts ..."
# copy scripts
cp -f ./skel.sh ~/bin
cp -f ./csk.sh ~/bin
# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk

PRINT_DEBUG "remove exsisting class templates ..."
# remove old scripts
rm ~/bin/ccl ~/bin/create.class.sh ~/bin/class.?pp.tmpl
PRINT_DEBUG "install exsisting class templates ..."
# copy scripts
cp -f ./class_tmpl/*.sh ~/bin
cp -f ./class_tmpl/*.tmpl ~/bin
# create easy name soft link
ln -s ~/bin/create.class.sh ~/bin/ccl
# create new link with multi name option built into script
ln -s ~/bin/run.create.class.sh ~/bin/ccl2

##{ END YOUR CODE  }##

PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"
