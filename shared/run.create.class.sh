#!/bin/bash
FILE='run.create.class.sh'
VERSION='0.1.6'
FILE_DATE='March 8, 2023'

# ! UNSUSED PARAMATERS !#
INPUT_PATH=~/bin
OUTPUT_PATH=.

for i in "$@"; do

    INPUT=$i
    CLASS_NAME=${INPUT%%*::}
    BASE_CLASS_NAME$=${INPUT##::*}
    ${INPUT_PATH}/create.class.sh ${CLASS_NAME} ${BASE_CLASS_NAME}

done
