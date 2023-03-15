#!/bin/bash
FILE='run.create.class.sh'
VERSION='0.1.6'
FILE_DATE='March 8, 2023'

INPUT_PATH=~/bin
OUTPUT_PATH=.

for i in "$@"; do

    CLASS_NAME=$i
    ${CLASS_NAME##::x}
    ${INPUT_PATH}/create.class.sh ${CLASS_NAME}

done
