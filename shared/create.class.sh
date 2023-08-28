#!/bin/bash
FILE='create.class.sh'
VERSION='08.28.2023.0'
FILE_DATE='Mon Aug 28 09:41:28 AM CDT 2023'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
WWW='https://github.com/brian8181'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

DEBUG_MSG="$PRINT_RED_DEBUG: "
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
##{ BEGIN YOUR CODE  }##

# USER SETTING
USER_NAME=$(whoami)
INPUT=$1
#INPUT_PATH=$2
#OUTPUT_PATH=$3
LICENSE=$4
AUTHOR=$5
BUILD_DATE=$6
VERSION=$7

CLASS_NAME=${INPUT%%::*}
BASE_CLASS_NAME=${INPUT#${CLASS_NAME}}
# Base class bug !!
BASE_CLASS_NAME=${INPUT##*::}
#BASE_CLASS_NAME=${BASE_CLASS_NAME:="NO_BASE"}

# ASSUME USER IS IN A PROJECT DIRECTORY
PRINT_DEBUG $PWD
# DEBUG
# pushd ~/tmp/abc
PRINT_DEBUG $PWD

if [ ! -z $CLASS_NAME ]
then
	if [ -e "./.project" ] # is this a project folder?
	then
		PRINT_INFO ${INPUT_PATH:-"~/bin"}
		
		if [ [ $BASE_CLASS_NAME = "NO_BASE" ] ]; then # no base class

			cat ${INPUT_PATH:-"/home/$USER_NAME/bin/"}class.cpp.tmpl \
			| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp

			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"/}class.hpp.tmpl \
			| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}.cpp/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp

			cat Makefile \
			| sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" \
			| sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > Makefile.tmp 
			# try to update Makefile with new rule
			MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			# make a backup of Makefile for now
			cat Makefile.tmp 
			sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > Makefile  
						
		else    # has a base class
			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class.base.hpp.tmpl \
			| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" /\
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl

			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class.base.cpp.tmpl \
			| sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}.cpp/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl	

			# now replace base class tag
			cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl \
			| sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp

			cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl \
			| sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" \
			| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
			| sed "s/@@LICENSE@@/${LICENSE}/g" \
			| sed "s/@@VERSION@@/${VERSION}/g" \
			| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
			| sed "s/@@FILE_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp	

			cat Makefile \
			| sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" \
			| sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > Makefile.tmp

			# try to update Makefile with new rule
			MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			# make a backup of Makefile for now
			cat Makefile.tmp | sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > Makefile
			#cat Makefile.tmp > Makefile./install
			rm  Makefile.tmp
			rm ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl
			rm ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl
		fi
	else
		echo "Error: This is not a project directory."
	fi
else
		echo "Error: No class name."
fi

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
