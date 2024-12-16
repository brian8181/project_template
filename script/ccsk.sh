#!/bin/bash

CLASS_NAME=$1
BASE_CLASS_NAME=$2
PREFIX=$HOME/bin/templates/class

# BEG_ESC='\s*[[~\s*'
# END_ESC='\s*~]]\s*'

BEG_ESC='\s*/*~\s*'
END_ESC='\s*~*/\s*'
# /*~$TAG~*/


# function replace_tag
# {
#     local SRC=$1
#     local DST=$2
#     local TAG=$2
#     local REPL=$TAG  
#     local EXPR='/\\*~\\$\\{${TAG}\\}~\\*'      
#     REPL="\${${TAG}}"
#     echo "$EXPR - $REPL"
#     #cat $PREFIX/{class.tmpl}.cpp | sed -E "s|${EXPR}/|${REPL}|g" > ${REPL}.cpp
# }

function create_class
{
    local CLASS_NAME=$1
    local EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    local BASE_EXPR="/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/"
    local REPL=${CLASS_NAME}

    cat $PREFIX/{class.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.cpp
    cat $PREFIX/{class.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.hpp
    cat makefile | sed "s|#PREREQUISTE#|\\$\\(BLD\\)/${CLASS_NAME}.o #PREREQUISTE#|g" > makefile.tmp 
    # try to update makefile with new rule
    MAKE_RULE=$(cat $PREFIX/make.class.snip.tmpl | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g")
    # make a backup of makefile for now
    cat makefile.tmp | sed -E "s|#AUTO_INSERT_POINT_DO_NOT_REMOVE#|${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#|g" > makefile
    rm makefile.tmp
}

function create_sub_class
{
    local CLASS_NAME=$1
    local BASE_CLASS_NAME=$2
    create_class $BASE_CLASS_NAME
    cat $PREFIX/{class.base.tmpl}.hpp | sed -E "s|$EXPR/|${CLASS_NAME}|g" > ${CLASS_NAME}.hpp.tmp
    cat $PREFIX/{class.base.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > ${CLASS_NAME}.cpp.tmp
    cat $PREFIX/{CLASS_NAME}.hpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.hpp
    cat $PREFIX/{CLASS_NAME}.cpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > ${CLASS_NAME}.cpp
}

if [[ -z $BASE_CLASS_NAME ]]; then
    create_class $CLASS_NAME
else
    create_sub_class $CLASS_NAME $BASE_CLASS_NAME
fi




