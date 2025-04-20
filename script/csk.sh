#!/bin/bash

# File Name:  skel.sh
# Build Date: Sat Dec 14 09:24:01 AM CST 2024
# Version:    0.0.1
# Info: create project skeleton

source color.sh
VERSION="0.0.1"
#EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"

function create_basic
{
	local APP_NAME=$1
	local EXPR="\\\\\*~\\$\\{APP_NAME\\}*~\\*\\\\"
	local EXPR2="\\\\\*~\\$\\{DATE\\}*~\\*\\\\"
	cp -rf $TEMPLATE_PATH/basic/* .

	touch .project
	cat tmpl.makefile | sed -E "s|${EXPR2}|$(date)|g" > tmpl.makefile.tmp
	cat tmpl.makefile.tmp | sed -E "s|${EXPR}|${APP_NAME}|g" > makefile
	chmod 644 makefile
	mv tmpl..gitignore .gitignore
	rm tmpl.*

	pushd src  > /dev/null
	cat  tmpl.cpp | sed -E "s|${EXPR}|${APP_NAME}|g" > ${APP_NAME}.cpp
	chmod 644 *.cpp
	mv tmpl.bash_color.hpp bash_color.hpp
	rm tmpl.*
	popd > /dev/null

	pushd man > /dev/null
	cat  tmpl.app.1 | sed -E "s|${EXPR}|${APP_NAME}|g" > ${APP_NAME}.1
 	chmod 644 ${APP_NAME}.1
	rm tmpl.*
	popd > /dev/null
}

function create_minimal
{
	local APP_NAME=$1
	local EXPR="\\\\\*~\\$\\{APP_NAME\\}*~\\*\\\\"

	cp -rf $TEMPLATE_PATH/minimal/* .
	touch .project
	cat tmpl.makefile | sed -E "s|${EXPR}|${APP_NAME}|g" > makefile
	chmod 644 makefile
	mv tmpl..gitignore .gitignore
	rm ./tmpl.*

	pushd src > /dev/null
	cat  tmpl.app.cpp | sed -E "s|${EXPR}|${APP_NAME}|g" > "${APP_NAME}.cpp"
	chmod 644 "${APP_NAME}.cpp"
	rm tmpl.*
	popd > /dev/null
}

function print_usage
{
	VERSION=$1
	echo -en "\n"
	echo -en "NAME:\n\tcsk\n\n"
	echo -en "DESCRIPTION:\n\tcreate skeleton c++ project\n\n"
	echo -en "SYNOPSIS:\n\t"
	echo -en "csk -[vhbmga] [[-u][[-d DIR][-p PARAMS]]] PROJECT_NAME [...]\n\n"
	echo -en "OPTIONS:\n\t"
	echo -en "-v, print version\n\n"
	echo -en "\t-h, print help\n\n"
	echo -en "\t-b, basic project\n\n"
	echo -en "\t-m, minimal project\n\n"
	echo -en "\t-g, gtk project\n\n"
	echo -en "\t-s, bash project\n\n"
	echo -en "\t-a, auto mode (create build dir & build)\n\n"
	echo -en "\t-d, project directory, default is current directory\n\n"
	echo -en "\t-u, generate cppunit test classes\n\n"
	echo -en "\t-p, add parameters (comma separated list)\n\n"
	echo -en "VERSION:\n\t"
	echo -en "csk - version - ${VERSION} - copyright $(date)\n\n"
}

OPTSTRING="vhbamd:"
while getopts ${OPTSTRING} opt; do
    case ${opt} in
        v)
			echo "version $VERSION"
			exit 0;
            ;;
        h)
			print_usage $VERSION
			exit 0;
            ;;
		b)
			CMD="create_basic"
            ;;
		m)
			CMD="create_minimal"
            ;;
		a)
			AUTO_MODE=TRUE
			echo "auto-mode ..."
			;;
		d)
			PREFIX=$OPTARG
			echo "PREFIX=$PREFIX"
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
TEMPLATE_PATH="${HOME}/bin/templates"

if [[ -z $CMD || -z "${APP_NAME}" ]]; then
	echo "incorrect options, no command set ..."
	echo "example '-b' for basic"
	exit 1
fi

mkdir -p "${PREFIX:=${PWD}}/${APP_NAME}"
pushd "${PREFIX}/${APP_NAME}" > /dev/null
${CMD} ${APP_NAME}
popd > /dev/null
echo "project created @ ${PREFIX}/${APP_NAME}"

if [[ -n "$AUTO_MODE" ]]; then
	pushd ${PREFIX}/${APP_NAME}
	if [ ![ -d "build" ] ]; then
		mkdir build
	fi
	make
	popd
fi
