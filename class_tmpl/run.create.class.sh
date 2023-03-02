#!/bin/bash
FILE='run.create.class.sh'
VERSION='0.1'
FILE_DATE='January 2, 2023'

INPUT_PATH=~/bin
OUTPUT_PATH=.

for i in "$@"; do

    CLASS_NAME=$i
    ${INPUT_PATH}/create.class.sh ${CLASS_NAME} ${BASE_CLASS_NAME}

done
