#!/bin/bash
FILE='create.class.sh'
VERSION='0.1.2.'
FILE_DATE='December 26, 2022'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")


# USER SETTING
USER_NAME=brian
DEBUG_MSG="$PRINT_RED_DEBUG: "
VERBOSE=1
DEBUG=1akwe
# END

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

##{ BEGIN YOUR CODE  }##

CLASS_NAME=$1
BASE_CLASS_NAME=$2
INPUT_PATH=$3
OUTPUT_PATH=$4

if [ ! -z $CLASS_NAME ]
then
	if [ -f "./.project" ] # is this a project folder?
	then
		PRINT_INFO ${INPUT_PATH:-"~/bin"}
		
		if [ -z $BASE_CLASS_NAME ]; then # no base class

			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.hpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp
			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.cpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp
			cat Makefile | sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" | sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > Makefile.tmp
			# try to update Makefile with new rule
			MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			# make a backup of Makefile for now
			cat Makefile.tmp | sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > Makefile  
			#rm  Makefile.tmp
			
		else    # has a base class
				cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.base.hpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl
				cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.base.cpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl	
				# now replace base class tag
				cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp
				cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp	
				cat Makefile | sed "s/#@@CLASS_NAME@@/\$(BUILD)\/${CLASS_NAME}.o #@@CLASS_NAME@@/g" | sed "s/#@@PREREQUISTE@@/${CLASS_NAME}.o #@@PREREQUISTE@@/g" > Makefile.tmp

				# try to update Makefile with new rule
				MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
				# make a backup of Makefile for now
				cat Makefile.tmp | sed "s/#AUTO_INSERT_POINT_DO_NOT_REMOVE#/${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#/g" > Makefile
				#cat Makefile.tmp > Makefile
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

