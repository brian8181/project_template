#!/bin/bash

FILE_NAME=$1
APP_NAME=$2 
TEMPLATE_NAME=$3
BUILD_DATE=$(date)
VERSION=$7
FILE_DATE=$(date)
USER_NAME=$(whoami)
USER_ROOT="/home/${USER_NAME}"
TEMPLATE_PATH="${USER_ROOT}/bin/templates/${TEMPLATE_NAME:=basic}"
PROJECT_PATH=$(pwd)/$APP_NAME

function ADD_HEADERS
{
	TMPL_NAME=$1
	REAL_NAME=$(echo ${TMPL_NAME%%.tmpl} | sed "s/@@.*@@/${APP_NAME}/g");
	echo $REAL_NAME
	cat  "./${TMPL_NAME}" \
		| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
				| sed "s/@@VERSION@@/${VERSION}/g" \
		| sed "s/@@FILE_DATE@@/${FILE_DATE}/g" \
		| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
		| sed "s/@@FILE_NAME@@/todo/g" > "./${REAL_NAME}"
	rm ./${TMPL_NAME}
}

# function LICENSE_HEADER
# {
#     LICENSE=$1
#     echo "adding ${LICENSE} license header ..."
    
#     cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.cpp.tmpl > ./@@APP_NAME@@.cpp.tmpl.tmp
# 	mv ./@@APP_NAME@@.cpp.tmpl.tmp ./@@APP_NAME@@.cpp.tmpl
# 	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.hpp.tmpl > ./@@APP_NAME@@.hpp.tmpl.tmp
# 	mv ./@@APP_NAME@@.hpp.tmpl.tmp ./@@APP_NAME@@.hpp.tmpl
# 	cat ~/bin/${LICENSE}_header.snip ./main.cpp.tmpl > ./main.cpp.tmpl.tmp
# 	mv ./main.cpp.tmpl.tmp ./main.cpp.tmpl
# 	cat ~/bin/${LICENSE}_header.snip ./main.hpp.tmpl > ./main.hpp.tmpl.tmp
# 	mv ./main.hpp.tmpl.tmp ./main.hpp.tmpl
# }

pushd ${PROJECT_PATH}
ADD_HEADERS "${FILE_NAME}"
popd

