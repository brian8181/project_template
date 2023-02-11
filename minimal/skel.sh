#!/bin/bash
FILE='./minimal/skel.sh'
VERSION='0.1'
FILE_DATE='October 30, 2021'

FMT_FG_RED='\e[31m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

# USER SETTING
DEBUG_MSG="$PRINT_RED_DEBUG: "
#VERBOSE=0
#DEBUG=0
# END

if [ -n $VERBOSE ]
then
	echo ${VERBOSE:-"File - $FILE"}.
	echo ${VERBOSE:-"Version - $VERSION"}.
	echo ${VERBOSE:-"Date - $FILE_DATE"}.
	echo ${VERBOSE:"Author - $AUTHOR"}.
	echo ${VERBOSE:-"Email - $EMAIL"}.
	echo ${VERBOSE:-"www - $WWW"}.
fi

function PRINT_DEBUG
{
    MSG=${DEBUG_MSG}$1
    echo -e ${DEBUG:-"$MSG"}
}
PRINT_DEBUG "$FILE -> Running... @ $DATE"

# YOUR CODE HERE
APP_NAME=$1 
TEMPLATE_PATH=$2
PROJECT_PATH=$3/$APP_NAME
#INPUT_TEMPLATE_PATH=$3
#TEMPLATE_PATH=${INPUT_PROJECT_PATH:-.}

mkdir -p $PROJECT_PATH
cp -rf $TEMPLATE_PATH/* $PROJECT_PATH 
touch $PROJECT_PATH/.project # create file that marks this a project folder
#cp -rf $TEMPLATE_PATH/.project $PROJECT_PATH 

pushd $PROJECT_PATH
cat ./configure.ac.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > configure.ac
rm configure.ac.tmpl
chmod 644 AUTHORS ChangeLog NEWS README* configure.ac Makefile.am
popd

pushd $PROJECT_PATH/build
cat ./Makefile.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile
#rm Makefile.tmpl
chmod 644 Makefile 
popd

pushd $PROJECT_PATH/src
cat  ./app.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.cpp
# cat  ./app.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.hpp
cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
# cat  ./app_test.cpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}_test/g" > ${APP_NAME}_test.cpp
# cat  ./@app@_test.hpp.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}_test/g" > ${APP_NAME}_test.hpp
chmod 644 *.cpp *.hpp Makefile*
rm *.tmpl
popd

# cd $PROJECT_PATH/man
# cat  ./app.1.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1
# cat  ./install.sh.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
# cat  ./Makefile.am.tmpl | sed "s/@@APP_NAME@@/${APP_NAME}/g" > Makefile.am
# rm *.tmpl
# chmod 644 install.sh Makefile* ${APP_NAME}.1

pushd $PROJECT_PATH
mv gitignore_template .gitignore
rm *skel.sh

git init
git add '*'
git commit -m 'initial commit'
popd

PRINT_DEBUG "$FILE -> Exiting.   @ $DATE"




