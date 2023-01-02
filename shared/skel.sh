#!/bin/bash
FILE='skel.h'
VERSION='0.1'
FILE_DATE='January 2, 2023'

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
	echo ${VERBOSE:+"File - $FILE"}.
	echo ${VERBOSE:+"Version - $VERSION"}.
	echo ${VERBOSE:+"Date - $FILE_DATE"}.
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
TEMPLATE_PATH=$2
PROJECT_PATH=$3/$APP_NAME
#INPUT_TEMPLATE_PATH=$3
#TEMPLATE_PATH=${INPUT_PROJECT_PATH:-.}

mkdir -p $PROJECT_PATH
cp -rf $TEMPLATE_PATH/* $PROJECT_PATH 
#cp -rf ../$TEMPLATE_PATH/shared $PROJECT_PATH/Makefile.tmpl
touch $PROJECT_PATH/.project # create file that marks this a project folder
#cp -rf $TEMPLATE_PATH/.project $PROJECT_PATH

pushd $PROJECT_PATH
# do auto tools files
cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
rm configure.ac.tmpl
chmod 644 AUTHORS ChangeLog NEWS README* configure.ac Makefile.am

# do makefile
pushd ./${APP_NAME}/
cat ./build/Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.tmpl
cat Makefile.tmpl | sed "s/@@CLASS_NAME@@//g" > Makefile # delete ? 
rm ./build/*
# mv Makefile.tmpl ./build/Makefile.tmpl
# cat Makefile.tpml > ./build/Makefile.tmpl

chmod 644 Makefile 
popd

# get dir name, aka template name
# TEMPLATE_NAME=${TEMPLATE_PATH##/*/}
# if[ ${TEMPLATE_NAME} == "basic" ]; then
# fi

# if [ -d "$PROJECT_PATH/man" ]
# then
# fi

pushd $PROJECT_PATH/src
cat  ./app.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.cpp
rm ./app.cpp.tmpl 
cat  ./app.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.hpp
cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
cat  ./app_test.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}_test/g" > ${APP_NAME}_test.cpp
cat  ./app_test.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}_test/g" > ${APP_NAME}_test.hpp
rm *.tmpl
chmod 644 *.cpp *.hpp Makefile*
popd

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
git init
git add '*'
git commit -m 'initial commit'
popd
# add to git hub
# gh --repo @@APP_NAME@@

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"

