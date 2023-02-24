#!/bin/bash
FILE='./shared/skeld.sh'
VERSION='0.1.1'
FILE_DATE='Febuary, 2023'
AUTHOR='Brian K Preston'
EMAIL='brain1818@gmail.com'
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
PROJECT_PATH=$2/$APP_NAME
TEMPLATE_PATH=$3

echo PARAMS $APP_NAME $TEMPLATE_NAME $TEMPLATE_PATH $PROJECT_PATH
PRINT_DEBUG "$APP_NAME $TEMPLATE_NAME $TEMPLATE_PATH $PROJECT_PATH"


echo "APP_NAME : $APP_NAME"
echo "PROJECT_PATH : $PROJECT_PATH"
echo "TEMPLATE_PATH : $TEMPLATE_PATH"

mkdir -p $PROJECT_PATH
cp -rf $TEMPLATE_PATH/* $PROJECT_PATH/

touch $PROJECT_PATH/.project # create file that marks this a project folder

pushd $PROJECT_PATH
# do auto tools files
cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
rm configure.ac.tmpl
chmod 644 AUTHORS ChangeLog NEWS README* configure.ac Makefile.am

# do makefile
cat ./build/Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.tmpl
cat Makefile.tmpl | sed "s/@@CLASS_NAME@@//g" > Makefile # delete ? 
rm ./build/*
chmod 644 Makefile 
#popd

pushd $PROJECT_PATH/src
cat  ./app.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.cpp
rm ./app.cpp.tmpl 
cat  ./app.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.hpp
cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
rm *.tmpl
chmod 644 *.cpp *.hpp Makefile*
popd

echo END_DEBUGGING
# END DEBUG
exit 1

pushd $PROJECT_PATH/man
cat  ./app.1.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1
cat  ./install.sh.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
rm *.tmpl
chmod 644 install.sh Makefile* ${APP_NAME}.1
popd

# move to project root, and stay
pushd $PROJECT_PATH
mv gitignore_template .gitignore
rm *skel.sh
# git init repository
# git init
# git add '*'
# git commit -m 'initial commit'
popd

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"

