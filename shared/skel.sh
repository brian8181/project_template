#!/bin/bash
#!/bin/bash

# File Name:  skel.sh
# Build Date: Sat Dec 14 09:24:01 AM CST 2024
# Version:    0.0.1
# Info: create project skeleton

source color.sh

function create_basic
{
	APP_NAME=$1
	mkdir -p $APP_NAME
	pushd ./${APP_NAME}
	cp -rf $TEMPLATE_PATH/basic/* .
	touch .project 
	
	cat ./tmpl.makefile | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./tmpl.makefile.tmp
	cat ./tmpl.makefile.tmp | sed "s/@@CLASS_NAME@@//g" > makefile
	chmod 644 makefile 
	mv tmpl..gitignore .gitignore
	rm ./tmpl.*

	
	pushd ./src  > /dev/null
	cat  ./tmpl.cpp | sed "s/@@APP_NAME@@/${APP_NAME}/g" > ./${APP_NAME}.cpp
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
	popd 
}

function create_minimal
{
	APP_NAME=$1
	mkdir -p $APP_NAME
	pushd ./${APP_NAME}
	cp -rf $TEMPLATE_PATH/minimal/* .
	touch .project 

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
	popd
}

OPTSTRING="vhbm"
while getopts ${OPTSTRING} opt; do
    case ${opt} in
        v)
            ;;
        h)
            ;;
		b)
			CMD="create_basic"
            ;;
		m)
			CMD="create_minimal"
            ;;
		:)
            echo "Option -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            exit 1
            ;;
	esac
done
shift $(($OPTIND-1))

APP_NAME=$1
TEMPLATE_PATH="${HOME}/bin/project_templates/"

${CMD:=create_basic} $APP_NAME
echo "project created @ $APP_NAME"
