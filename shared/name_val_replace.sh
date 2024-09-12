#!/bin/bash
CLASS_NAME=$1
USER_NAME=$(whoami)
#NAME=$1
LICENSE="None"
AUTHOR="Brian K Preston"
FILE_NAME=$2
BUILD_DATE=$(date)
VERSION="0.0.1"

cat ${INPUT_PATH:-"/home/$USER_NAME/bin"/}class.cpp.tmpl \
    | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
    | sed "s/@@AUTHOR@@/${AUTHOR}/g" \
    | sed "s/@@LICENSE@@/${LICENSE}/g" \
    | sed "s/@@VERSION@@/${VERSION}/g" \
    | sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
    | sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" \
    > abc.cpp

cat ${INPUT_PATH:-"/home/$USER_NAME/bin"/}class.hpp.tmpl \
    | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
    | sed "s/@@AUTHOR@@/${AUTHOR}/g" \
    | sed "s/@@LICENSE@@/${LICENSE}/g" \
    | sed "s/@@VERSION@@/${VERSION}/g" \
    | sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
    | sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" \
    > ./tmp2.txt

cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class.base.hpp.tmpl \
    | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
    | sed "s/@@AUTHOR@@/${AUTHOR}/g" \
    | sed "s/@@LICENSE@@/${LICENSE}/g" \
    | sed "s/@@VERSION@@/${VERSION}/g" \
    | sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
    | sed "s/@@FILE_NAME@@/${CLASS_NAME}.hpp/g" > tem3.txt
    #./src/${CLASS_NAME}.hpp
    #> ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.hpp.tmpl

cat ${INPUT_PATH:-"/home/$USER_NAME/bin"}/class.base.cpp.tmpl \
    | sed "s/@@CLASS_NAME@@/${CLASS_NAME}/g" \
    | sed "s/@@AUTHOR@@/${AUTHOR}/g" \
    | sed "s/@@LICENSE@@/${LICENSE}/g" \
    | sed "s/@@VERSION@@/${VERSION}/g" \
    | sed "s/@@BUILD_DATE@@/${BUILD_DATE}/g" \
    | sed "s/@@FILE_NAME@@/${CLASS_NAME}.cpp/g" \
    > ${OUTPUT_PATH:-"."}/src/${CLASS_NAME}.cpp.tmpl	

    # now replace base class tag