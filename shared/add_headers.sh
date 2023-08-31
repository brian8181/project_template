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

pushd ~/src/create_project_template/shared

ADD_HEADERS class.cpp.tmpl

