#!/bin/bash
FILE='./shared/skel.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")
DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
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
##{ BEGIN YOUR CODE  }##

APP_NAME=$1 
TEMPLATE_NAME=$2
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
TEMPLATE_PATH="${USER_ROOT}/bin/project_templates/${TEMPLATE_NAME:=basic}"
PROJECT_PATH=$(pwd)/$APP_NAME

mkdir -p $PROJECT_PATH
cp -rf $TEMPLATE_PATH/* $PROJECT_PATH/
touch $PROJECT_PATH/.project # create file that marks this a project folder
pushd $PROJECT_PATH/ #> /dev/null

if [[ ${TEMPLATE_PATH##/*/} = "basic" || ${TEMPLATE_PATH##/*/} = "gtk" ]]; then

	cat ./tmpl.makefile | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./tmpl.makefile.tmp
	cat ./tmpl.makefile.tmp | sed "s/@@CLASS_NAME@@//g" > makefile
	chmod 644 makefile 
	mv tmpl..gitignore .gitignore
	rm ./tmpl.*


	pushd ./src # > /dev/null
	cat  ./tmpl.app.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.cpp
	cat  ./tmpl.app.hpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.hpp
	cat  ./tmpl.main.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./main.cpp
	chmod 644 *.cpp *.hpp
	mv tmpl.bash_color.hpp bash_color.hpp
	rm ./tmpl.*
	popd #> /dev/null

	# pushd ./man > /dev/null
	# cat  ./tmpl.app.1 | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1 
	# cat  ./tmpl.install.sh | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
	# rm *.tmpl
	# chmod 644 install.sh Makefile* ${APP_NAME}.1
	# popd > /dev/null
fi

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"

