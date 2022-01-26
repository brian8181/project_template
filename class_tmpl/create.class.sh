#!/bin/bash
FILE='create.class.sh'
VERSION='0.1.1'
FILE_DATE='Jnauary 1, 2022'
AUTHOR='Brian K. Preston'
EMAIL='brian8181@gamil.com'
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
CLASS_NAME=$1
INPUT_PATH=$2
OUTPUT_PATH=$3

if [ ! -z $CLASS_NAME ]
then
	# is this a project folder
	if [ -f "./.project" ]
	then
		pushd ./build
		rm Makefile.tmp Makefile.tmp2
		PRINT_DEBUG ${INPUT_PATH:-"~/bin"}
		cat ${INPUT_PATH:-"/home/brian/bin"}/class.hpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-".."}/src/${CLASS_NAME}.hpp
		cat ${INPUT_PATH:-"/home/brian/bin"}/class.cpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-".."}/src/${CLASS_NAME}.cpp	
		cat Makefile.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}.o  @@CLASS_NAME@@/g" > Makefile.tmp
		# try to update Makefile with new rule
		MAKE_RULE=$(cat ${INPUT_PATH:-"/home/brian/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
		# make a backup of Makefile for now
		cat Makefile.tmp | sed "s/## auto gernerated here ##/${MAKE_RULE}\n## auto gernerated here ##/g" > Makefile.tmpl
		cat Makefile.tmpl | sed "s/@@CLASS_NAME@@//g" > Makefile
		rm  Makefile.tmp
		popd

	else
		echo "Error: This is not a project directory"
	fi
else
		echo "Error: No class name"
fi
##{ END YOUR CODE  }##

PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"
