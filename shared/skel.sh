#!/bin/bash
FILE='./shared/skel.sh'
VERSION='0.1.7'
FILE_DATE='Tue Aug 22 01:30:16 PM CDT 2023'
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
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1

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

function ADD_HEADERS
{
	FILE=$1
	NAME=$(echo ${FILE%%.tmpl} | sed "s/@@APP_NAME@@/${APP_NAME}/g");
	echo $NAME
	cat  "./${FILE}" \
		| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
		| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
		| sed "s/@@LICENSE@@/${LICENSE}/g" \
		| sed "s/@@VERSION@@/${VERSION}/g" \
		| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
		| sed "s/@@FILE_NAME@@/todo/g" > "./${NAME}"
}

PRINT_INFO "$FILE -> Running... @ $DATE"

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
# do makefile
cat ./Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile
rm Makefile.tmpl
               
pushd ./src > /dev/null
if [[ ${LICENSE:="None"} = "GPL" || ${LICENSE:="None"} = "BSD" ]]; then
	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.cpp.tmpl > ./@@APP_NAME@@.cpp.tmpl.tmp
	mv ./@@APP_NAME@@.cpp.tmpl.tmp ./@@APP_NAME@@.cpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.hpp.tmpl > ./@@APP_NAME@@.hpp.tmpl.tmp
	mv ./@@APP_NAME@@.hpp.tmpl.tmp ./@@APP_NAME@@.hpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./main.cpp.tmpl > ./main.cpp.tmpl.tmp
	mv ./main.cpp.tmpl.tmp ./main.cpp.tmpl
fi

ADD_HEADERS "./main.cpp.tmpl"
popd > /dev/null

PRINT_INFO "TEMPLATE IS BASIC OR GTK"

pushd $PROJECT_PATH
# do auto tools files
cat ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
rm configure.ac.tmpl Makefile.am.tmpl

pushd ./src > /dev/null
ADD_HEADERS ./@@APP_NAME@@.cpp.tmpl ${APP_NAME}
ADD_HEADERS ./@@APP_NAME@@.hpp.tmpl ${APP_NAME}
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

mv gitignore_template .gitignore
popd > /dev/null # out of project path

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
