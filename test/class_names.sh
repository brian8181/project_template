#!/bin/bash

# shape
# circle::shape
# square::shape

INPUT=$1
echo ${INPUT%%::*}
echo ${INPUT##*::}

CLASS_NAME=${INPUT%%::*}
BASE_CLASS_NAME=${INPUT##*::}

echo "CLASS_NAME=${CLASS_NAME}"
echo "BASE_CLASS_NAME=${BASE_CLASS_NAME}"

if [ $BASE_CLASS_NAME = $CLASS_NAME ]; then 
    echo "no base ..."
fi

if [ $BASE_CLASS_NAME = "shape1" ]; then 
    echo "testing ..."
fi
