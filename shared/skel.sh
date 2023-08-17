#!/bin/bash
FILE='./shared/skel.sh'
VERSION='0.1.7'
FILE_DATE='May 23, 2023'
AUTHOR='Brian K Preston'
EMAIL='brian8181@gmail.com'
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
##{ BEGIN YOUR CODE  }##

APP_NAME=$1 
TEMPLATE_NAME=$2
LICENSE=$3
AUTHOR=$4
BUILD_DATE=$5
VERSION=$6
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
TEMPLATE_PATH="${USER_ROOT}/bin/templates/${TEMPLATE_NAME:=basic}"
PROJECT_PATH=$(pwd)/$APP_NAME

mkdir -p $PROJECT_PATH
pushd $PROJECT_PATH > /dev/null
cp -rf $TEMPLATE_PATH/* ./
touch .project  # create file that marks this a project folder
touch project_
# do makefile
cat ./Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile
rm Makefile.tmpl

pushd ./src > /dev/null

cat  ./main.cpp.tmpl \
| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
| sed "s/@@LICENSE@@/${LICENSE}/g" \
| sed "s/@@VERSION@@/${VERSION}/g" \
| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
| sed "s/@@FILE_NAME@@/main.cpp/g" > main.cpp

popd > /dev/null

if [[ ${TEMPLATE_PATH##/*/} = "basic" || ${TEMPLATE_PATH##/*/} = "gtk" ]]; then

	PRINT_INFO "TEMPLATE IS BASIC OR GTK"
	pushd $PROJECT_PATH
	# do auto tools files
	cat ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
	cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
	rm configure.ac.tmpl Makefile.am.tmpl
	
	pushd ./src > /dev/null
	
	cat  ./@@APP_NAME@@.cpp.tmpl \
	| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
	| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
	| sed "s/@@LICENSE@@/${LICENSE}/g" \
	| sed "s/@@VERSION@@/${VERSION}/g" \
	| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
	| sed "s/@@FILE_NAME@@/${APP_NAME}.cpp/g" > ${APP_NAME}.cpp

	cat  ./@@APP_NAME@@.hpp.tmpl \
	| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
	| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
	| sed "s/@@LICENSE@@/${LICENSE}/g" \
	| sed "s/@@VERSION@@/${VERSION}/g" \
	| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
	| sed "s/@@FILE_NAME@@/${APP_NAME}.hpp/g" > ${APP_NAME}.hpp

	cat  ./main.hpp.tmpl \
	| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
	| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
	| sed "s/@@LICENSE@@/${LICENSE}/g" \
	| sed "s/@@VERSION@@/${VERSION}/g" \
	| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
	| sed "s/@@FILE_NAME@@/main.hpp/g" > main.hpp

	cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
	rm *.tmpl
	
	popd > /dev/null

	pushd ./man > /dev/null
	cat  ./@@APP_NAME@@.1.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1
	cat  ./install.sh.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
	cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
	rm *.tmpl
	
	popd > /dev/null
	popd > /dev/null 
fi

if [[ ${TEMPLATE_PATH##/*/} = "basic" ]]; then
	echo "basic"
fi

if [[ ${TEMPLATE_PATH##/*/} = "basic_nam" ]]; then
	echo "basic_nam"
fi

if [[ ${TEMPLATE_PATH##/*/} = "gtk" ]]; then
	echo "gtk"
fi

if [[ ${TEMPLATE_PATH##/*/} = "minimal" ]]; then
	echo "minimal"
fi

mv gitignore_template .gitignore
popd > /dev/null # out of project path

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
