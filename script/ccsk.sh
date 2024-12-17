#!/bin/bash

CLASS_NAME=$1
BASE_CLASS_NAME=
PREFIX=$HOME/bin/templates/class

# BEG_ESC='\s*[[~\s*'
# END_ESC='\s*~]]\s*'
BEG_ESC='\s*/*~\s*'
END_ESC='\s*~*/\s*'

function create_class
{
    local CLASS_NAME=$1
    local EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    local BASE_EXPR="/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/"
    local REPL=${CLASS_NAME}
    cat $PREFIX/{class.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.cpp
    cat $PREFIX/{class.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.hpp
    # add prerequistes
    cat makefile | sed "s|#CCSK_PREREQUISTE#|\\$\\(BLD\\)/${CLASS_NAME}.o #CCSK_PREREQUISTE#|g" > makefile.tmp 
    # add new make rule
    cat makefile.tmp | sed -E "s|#CCSK_RULE#|$(cat $PREFIX/make.rule.frag | sed -E "s|$EXPR|${CLASS_NAME}|g")\n#CCSK_RULE#|g" > makefile
    rm makefile.tmp
}

function create_sub_class
{
    local CLASS_NAME=$1
    local BASE_CLASS_NAME=$2
    create_class $BASE_CLASS_NAME
    cat $PREFIX/{class.base.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > ${CLASS_NAME}.hpp.tmp
    cat $PREFIX/{class.base.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > ${CLASS_NAME}.cpp.tmp
    cat $PREFIX/{CLASS_NAME}.hpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.hpp
    cat $PREFIX/{CLASS_NAME}.cpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.cpp
}

if [ ! -f ".project" ]; then
    echo "error: not a project directory!"
    exit 1;
fi

if [[ -z $BASE_CLASS_NAME ]]; then

    for name in "$@"; do 
        create_class $name
    done 

else
    create_sub_class $CLASS_NAME $BASE_CLASS_NAME
fi




