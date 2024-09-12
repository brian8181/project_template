#!/bin/bash
<<<<<<< HEAD
FILE='./shared/skel.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
=======
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778

# File info
FILE='./shared/skel.sh'
FILE_NAME=$FILE
VERSION='0.1.7'
FILE_DATE='Tue Aug 22 01:30:16 PM CDT 2023'

# Debug Info
FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")
<<<<<<< HEAD

=======
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1

<<<<<<< HEAD
if [ -n $VERBOSE ]
then
	echo ${VERBOSE:+"File - $FILE"}
	echo ${VERBOSE:+"Version - $VERSION"}
	echo ${VERBOSE:+"Date - $FILE_DATE"}
fi
=======
# Input Paramaters
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
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778

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
	PRINT_INFO "adding headers, $1 ..."
	TMPL_NAME=$1
	REAL_NAME=$(echo ${TMPL_NAME%%.tmpl} | sed "s/@@.*@@/${APP_NAME}/g");

<<<<<<< HEAD
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
pushd $PROJECT_PATH > /dev/null

cat ./Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.tmp
cat Makefile.tmp | sed "s/@@CLASS_NAME@@//g" > Makefile
rm Makefile.tmp*
chmod 644 Makefile 

if [[ ${TEMPLATE_PATH##/*/} = "basic" || ${TEMPLATE_PATH##/*/} = "gtk" ]]; then

	pushd ./src > /dev/null
	cat  ./app.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.cpp
	cat  ./app.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.hpp
	cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
	rm *.tmpl
	chmod 644 *.cpp *.hpp Makefile*
	popd > /dev/null

	pushd ./man > /dev/null
	cat  ./app.1.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1
	cat  ./install.sh.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
	cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
	rm *.tmpl
	chmod 644 install.sh Makefile* ${APP_NAME}.1
	popd > /dev/null
=======
	cat  "./${TMPL_NAME}" \
		| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
		| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
		| sed "s/@@LICENSE@@/${LICENSE}/g" \
		| sed "s/@@VERSION@@/${VERSION}/g" \
		| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
		| sed "s/@@FILE_NAME@@/no file name/g" > "./${REAL_NAME}"
	rm ./${TMPL_NAME}
}
if [ -n $VERBOSE ]
then
	PRINT_INFO ${VERBOSE:+"File - $FILE"}
	PRINT_INFO ${VERBOSE:+"Version - $VERSION"}
	PRINT_INFO ${VERBOSE:+"Date - $FILE_DATE"}
	PRINT_INFO ${VERBOSE:+"Author - $AUTHOR"}
	PRINT_INFO ${VERBOSE:+"Email - $EMAIL"}
	PRINT_INFO ${VERBOSE:+"www - $WWW"}
>>>>>>> 2ee88bdf43d57d20741313181bba6426831c6778
fi

PRINT_INFO "$FILE -> Running... @ $DATE"
PRINT_INFO "Create project directory, \"${PROJECT_PATH}\" ..."

mkdir -p $PROJECT_PATH

# ** PUSHD **
pushd $PROJECT_PATH > /dev/null
PRINT_INFO "Enter \"$PWD\" directory ..."

PRINT_INFO "Copy template files to \"${PROJECT_PATH} \"..."
cp -rf $TEMPLATE_PATH/* ./
touch .project  # create file that marks this a project folder

PRINT_INFO "Create makefile ..."
cat ./makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > makefile # create makefile
rm makefile.tmpl

# auto tools files
cat ./makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > makefile.am
cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
rm configure.ac.tmpl makefile.am.tmpl

# ** PUSHD **
pushd ./src > /dev/null
PRINT_INFO "Enter \"$PWD\" directory ..."

# auto tools files
cat ./makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > makefile.am
rm makefile.am.tmpl

PRINT_INFO "Add license headers to source files ..."
if [[ ${LICENSE:="None"} = "GPL" || ${LICENSE:="None"} = "BSD" ]]; then
	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.cpp.tmpl > ./@@APP_NAME@@.cpp.tmpl.tmp
	mv ./@@APP_NAME@@.cpp.tmpl.tmp ./@@APP_NAME@@.cpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.hpp.tmpl > ./@@APP_NAME@@.hpp.tmpl.tmp
	mv ./@@APP_NAME@@.hpp.tmpl.tmp ./@@APP_NAME@@.hpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./main.cpp.tmpl > ./main.cpp.tmpl.tmp
	mv ./main.cpp.tmpl.tmp ./main.cpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./bash_color.h.tmpl > ./bash_color.h.tmpl.tmp
	mv ./bash_color.h.tmpl.tmp ./bash_color.h.tmpl
fi

ADD_HEADERS "./main.cpp.tmpl"
ADD_HEADERS "./bash_color.h.tmpl"
ADD_HEADERS ./@@APP_NAME@@.cpp.tmpl
ADD_HEADERS ./@@APP_NAME@@.hpp.tmpl

# test file
ADD_HEADERS test.txt.tmpl

# ** POPD **
PRINT_INFO "Leave source directory ..."
popd > /dev/null

# ** PUSHD **
pushd ./man > /dev/null
PRINT_INFO "Enter \"$PWD\" directory ..."

cat  ./@@APP_NAME@@.1.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1
cat  ./install.sh.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
cat  ./makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > makefile.am
rm *.tmpl

# ** POPD **
PRINT_INFO "Leave man directory ..."
popd > /dev/null

mv gitignore_template .gitignore
touch .project

# ** POPD **
PRINT_INFO "Leave project directory ..."
popd > /dev/null # out of project path

PRINT_INFO "$FILE -> Exiting.   @ $DATE"
