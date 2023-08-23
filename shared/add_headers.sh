#!/bin/bash

function ADD_HEADERS
{

	FILE=$1
    echo "adding file ${FILE} ..."

	cat  ./${FILE} \
	| sed "s/@@APP_NAME@@/${APP_NAME}/g" \
	| sed "s/@@AUTHOR@@/${AUTHOR}/g" \
	| sed "s/@@LICENSE@@/${LICENSE}/g" \
	| sed "s/@@VERSION@@/${VERSION}/g" \
	| sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" #\
	#| sed "s/@@FILE_NAME@@/${FILE%%.tmpl}/g" > ${FILE%%.tmpl}
}

function LICENSE_HEADER
{
    LICENSE=$1

    echo "adding ${LICENSE} license header ..."
    
    cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.cpp.tmpl > ./@@APP_NAME@@.cpp.tmpl.tmp
	mv ./@@APP_NAME@@.cpp.tmpl.tmp ./@@APP_NAME@@.cpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./@@APP_NAME@@.hpp.tmpl > ./@@APP_NAME@@.hpp.tmpl.tmp
	mv ./@@APP_NAME@@.hpp.tmpl.tmp ./@@APP_NAME@@.hpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./main.cpp.tmpl > ./main.cpp.tmpl.tmp
	mv ./main.cpp.tmpl.tmp ./main.cpp.tmpl
	cat ~/bin/${LICENSE}_header.snip ./main.hpp.tmpl > ./main.hpp.tmpl.tmp
	mv ./main.hpp.tmpl.tmp ./main.hpp.tmpl
}

pushd ~/src/create_project_template/shared

ADD_HEADERS class.cpp.tmpl

