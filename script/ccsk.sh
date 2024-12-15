#!/bin/bash

CLASS_NAME=$1
BASE_CLASS_NAME=$2
PREFIX=./templates/class

function create_class
{
    local CLASS_NAME=$1
    cat $PREFIX/{class.tmpl}.cpp | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g" > ${CLASS_NAME}.cpp
    cat $PREFIX/{class.tmpl}.hpp | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g" > ${CLASS_NAME}.hpp
}

function create_sub_class
{
    local CLASS_NAME=$1
    local BASE_CLASS_NAME=$2
    create_class $BASE_CLASS_NAME
    cat $PREFIX/{class.base.tmpl}.hpp | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g" > ${CLASS_NAME}.hpp.tmp
    cat $PREFIX/{class.base.tmpl}.cpp | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g" > ${CLASS_NAME}.cpp.tmp
    cat $PREFIX/{CLASS_NAME}.hpp.tmp | sed -E "s|/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.hpp
    cat $PREFIX/{CLASS_NAME}.cpp.tmp | sed -E "s|/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.cpp
}

if [[ -z $BASE_CLASS_NAME ]]; then
    create_class $CLASS_NAME
    #todo makefile

else
    create_sub_class $CLASS_NAME $BASE_CLASS_NAME
    #todo makefile
fi




