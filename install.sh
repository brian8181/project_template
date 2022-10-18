#!/bin/bash
FILE='install.sh'
VERSION='0.0.2'
FILE_DATE='January 1, 2022'
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

PRINT_DEBUG "remove existing project templates ..."
# remove "project_templates" before update
rm -rf ~/bin/project_templates
PRINT_DEBUG "install project templates ..."
# copy templates
mkdir ~/bin/project_templates
cp -r ./basic ~/bin/project_templates
cp -r ./minimal ~/bin/project_templates
cp -r ./gtk ~/bin/project_templates

PRINT_DEBUG "remove existing project scripts ..."
# remove old scripts & links
if [ -f ~/bin/skel.sh ] 
then
	rm ~/bin/skel.sh
fi

if [ -f ~/bin/csk.sh ]
then
	rm ~/bin/csk.sh
fi

if [ -f ~/bin/csk ]
then
	rm ~/bin/csk
fi

#rm ~/bin/skel.sh ~/bin/csk.sh ~/bin/csk 
PRINT_DEBUG "install exsisting project scripts ..."
# copy scripts
cp -f ./basic/skel.sh ~/bin
cp -f ./basic/csk.sh ~/bin
# create easy name soft link
ln -s ~/bin/csk.sh ~/bin/csk

PRINT_DEBUG "remove existing class templates ..."
# remove old scripts
if [ -f ~/bin/ccl ] 
then
	rm ~/bin/ccl
fi

if [ -f ~/bin/ccl2 ] 
then
	rm ~/bin/ccl2
fi

if [ -f ~/bin/create.class.sh ] 
then
	rm ~/bin/create.class.sh
fi

if [ -f ~/bin/run.create.class.sh ] 
then
	rm ~/bin/run.create.class.sh
fi

if [ -f ~/bin/~/bin/class.?pp.tmpl ] 
then
	rm ~/bin/~/bin/class.?pp.tmpl
fi
#rm ~/bin/ccl ~/bin/ccl2 ~/bin/create.class.sh ~/bin/class.?pp.tmpl
PRINT_DEBUG "install existing class templates ..."
# copy scripts
cp -f ./class_tmpl/*.sh ~/bin
cp -f ./class_tmpl/*.tmpl ~/bin
# create easy name soft link
ln -s ~/bin/create.class.sh ~/bin/ccl
# create new link with multi name option built into script
ln -s ~/bin/run.create.class.sh ~/bin/ccl2

##{ END YOUR CODE  }##

PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"
