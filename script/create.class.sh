#!/bin/bash
FILE='create.class.sh'
VERSION='08.28.2023.0'
FILE_DATE='Mon Aug 28 09:41:28 AM CDT 2023'


FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

DEBUG_MSG="$PRINT_RED_DEBUG: "
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

# USER SETTING
USER_NAME=$(whoami)
INPUT=$1
BUILD_DATE=$4
VERSION=$5

echo '$INPUT'=$INPUT
CLASS_NAME=${INPUT%%::*}
BASE_CLASS_NAME=${INPUT##*::}

# ASSUME USER IS IN A PROJECT DIRECTORY #

## DEBUG BEGIN ##

PRINT_DEBUG '$PWD'=$PWD
#cd ~/tmp/abc
# #pushd ~/tmp/abc
PRINT_DEBUG '$PWD'=$PWD
echo '${CLASS_NAME}'=${CLASS_NAME}
echo '${BASE_CLASS_NAME}'=${BASE_CLASS_NAME}

## DEBUG END ##

if [ ! -z $CLASS_NAME ]
then

	if [ -e "./.project" ] # is this a project folder?
	then
				
		if [ $BASE_CLASS_NAME = $CLASS_NAME ]; then # no base class

			cat ~/bin/class.cpp.tmpl \
				| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
				| sed "s/@@VERSION@@/${VERSION}/g" \
				| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
				| sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" > ./src/${CLASS_NAME}.cpp

			cat ~/bin/class.hpp.tmpl \
				| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
				| sed "s/@@VERSION@@/${VERSION}/g" \
				| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
				| sed "s/@@FILE_NAME@@/${CLASS_NAME}.cpp/g" > ./src/${CLASS_NAME}.hpp

			cat makefile \
				| sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" \
			 	| sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > makefile.tmp 

			# try to update makefile with new rule
			MAKE_RULE=$(cat ~/bin/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			# make a backup of makefile for now
			cat makefile.tmp | sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > makefile
			rm  makefile.tmp

		else    # has a base class
			cat ~/bin/class.base.hpp.tmpl \
				| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
				| sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" \
				| sed "s/@@VERSION@@/${VERSION}/g" \
				| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
				| sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" > ./src/${CLASS_NAME}.hpp

			cat ~/bin/class.base.cpp.tmpl \
				| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
				| sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" \
				| sed "s/@@VERSION@@/${VERSION}/g" \
				| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
				| sed "s/@@FILE_NAME@@/${CLASS_NAME}.cpp/g" > ./src/${CLASS_NAME}.cpp

			cat makefile \
				| sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" \
				| sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > makefile.tmp

			# try to update makefile with new rule
			MAKE_RULE=$(cat ~/bin/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			# make a backup of makefile for now
			cat makefile.tmp | sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > makefile
			rm  makefile.tmp
		fi
	else
		echo "Error: This is not a project directory."
	fi
else
		echo "Error: No class name."
fi

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
