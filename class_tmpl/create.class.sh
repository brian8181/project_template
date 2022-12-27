#!/bin/bash
FILE='create.class.sh'
VERSION='0.1.1'
FILE_DATE='Jnauary 1, 2022'
FMT_FG_RED='\e[31m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

# USER SETTING
USER_NAME=brian
DEBUG_MSG="$PRINT_RED_DEBUG: "
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

PRINT_DEBUG "$FILE -> Running... @ $DATE"

##{ BEGIN YOUR CODE  }##
CLASS_NAME=$1
BASE_CLASS_NAME=$2
INPUT_PATH=$3
OUTPUT_PATH=$4

if [ ! -z $CLASS_NAME ]
then
	# is this a project folder
	if [ -f "./.project" ]
	then
		#pushd ./build
		if [ -f Makefile.tmp ]; then
			rm Makefile.tmp
		fi
		if [ -f Makefile.tmp2 ]; then
			rm Makefile.tmp2
		fi
		PRINT_DEBUG ${INPUT_PATH:-"~/bin"}
		
		if [ -z $BASE_CLASS_NAME ]; then

			echo 'BOOM BOOM POW'
			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.hpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp
			cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.cpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp
			# now remove base class tag
			# no need if using correct templates
			# cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp
			# cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp	
			echo 'BOOM BOOM POW2' 
			echo $PWD
			cat Makefile.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}.o  @@CLASS_NAME@@/g" > Makefile.tmp
			echo 'BOOM BOOM POW3'
			# try to update Makefile with new rule
			MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
			echo 'BOOM BOOM POW4'
			# make a backup of Makefile for now
			cat Makefile.tmp | sed "s/## auto gernerated here ##/${MAKE_RULE}\n## auto gernerated here ##/g" > Makefile.tmpl
			cat Makefile.tmpl | sed "s/@@CLASS_NAME@@//g" > Makefile
			# no backup
			# cat Makefile.tmp | sed "s/## auto gernerated here ##/${MAKE_RULE}\n## auto gernerated here ##/g" | sed "s/@@CLASS_NAME@@//g" > Makefile;
			rm  Makefile.tmp
			
		else
				cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.base.hpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl
				cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class_tmpl/class.base.cpp.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl	
				# now replace base class tag
				cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp
				cat ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl | sed "s/@@BASE_CLASS_NAME@@/${BASE_CLASS_NAME}/g" > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp	
				cat Makefile.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}.o  @@CLASS_NAME@@/g" > Makefile.tmp
				# try to update Makefile with new rule
				MAKE_RULE=$(cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/make.class.snip.tmpl | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g")
				# make a backup of Makefile for now
				cat Makefile.tmp | sed "s/## auto gernerated here ##/${MAKE_RULE}\n## auto gernerated here ##/g" > Makefile.tmpl
				cat Makefile.tmpl | sed "s/@@CLASS_NAME@@//g" > Makefile
				rm  Makefile.tmp 
				rm ../src/${CLASS_NAME}.cpp.tmpl  ../src/${CLASS_NAME}.hpp.tmpl
		fi
		#popd

	else
		echo "Error: This is not a project directory."
	fi
else
		echo "Error: No class name."
fi
##{ END YOUR CODE  }##

PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"
