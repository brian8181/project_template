#!/bin/bash
#!/bin/bash

# File Name:  skel.sh
# Build Date: Sat Dec 14 09:24:01 AM CST 2024
# Version:    0.0.1
# Info: create project skeleton

source color.sh

APP_NAME=$1 
TEMPLATE_NAME=$2
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
TEMPLATE_PATH="${USER_ROOT}/bin/project_templates/${TEMPLATE_NAME:=basic}"
PROJECT_PATH=$(pwd)/$APP_NAME

mkdir -p $PROJECT_PATH
cp -rf $TEMPLATE_PATH/* $PROJECT_PATH/
touch $PROJECT_PATH/.project # create file that marks this a project folder
pushd $PROJECT_PATH/ > /dev/null

if [[ ${TEMPLATE_PATH##/*/} = "basic" || ${TEMPLATE_PATH##/*/} = "gtk" ]]; then
	
	cat ./tmpl.makefile | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./tmpl.makefile.tmp
	cat ./tmpl.makefile.tmp | sed "s/@@CLASS_NAME@@//g" > makefile
	chmod 644 makefile 
	mv tmpl..gitignore .gitignore
	rm ./tmpl.*

	pushd ./src > /dev/null
	cat  ./tmpl.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.cpp
	# cat  ./tmpl.app.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.cpp
	# cat  ./tmpl.app.hpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.hpp
	# cat  ./tmpl.main.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./main.cpp
	chmod 644 *.cpp
	mv tmpl.bash_color.hpp bash_color.hpp
	rm ./tmpl.*
	popd > /dev/null

	pushd ./man > /dev/null
	cat  ./tmpl.app.1 | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ${APP_NAME}.1 
	#cat  ./tmpl.install.sh | sed "s/@@APP_NAME@@/${APP_NAME}/g" > install.sh
	chmod 644 ${APP_NAME}.1
	rm ./tmpl.*
	popd > /dev/null
fi

if [[ ${TEMPLATE_PATH##/*/} = "minimal" ]]; then

	cat ./tmpl.makefile | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./tmpl.makefile.tmp
	cat ./tmpl.makefile.tmp | sed "s/@@CLASS_NAME@@//g" > makefile
	chmod 644 makefile 
	mv tmpl..gitignore .gitignore
	rm ./tmpl.*

	pushd ./src > /dev/null
	cat  ./tmpl.app.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.cpp
	chmod 644 *.cpp
	rm ./tmpl.*
	popd > /dev/null
fi

echo "project created @ $PROJECT_PATH"
