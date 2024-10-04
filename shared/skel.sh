#!/bin/bash
<<<<<<< HEAD
FILE='./shared/skel.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
=======
>>>>>>> 82b3b6bb7c4a7964082013b4b260a4a9ddc5a60a

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")
<<<<<<< HEAD

=======
>>>>>>> 82b3b6bb7c4a7964082013b4b260a4a9ddc5a60a
DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1
<<<<<<< HEAD
	
=======

>>>>>>> 82b3b6bb7c4a7964082013b4b260a4a9ddc5a60a
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
<<<<<<< HEAD
=======

	cat  "./${TMPL_NAME}" \
		| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
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
>>>>>>> 82b3b6bb7c4a7964082013b4b260a4a9ddc5a60a
fi

mv gitignore_template .gitignore
popd > /dev/null

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"

