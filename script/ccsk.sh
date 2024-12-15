#!/bin/bash

CLASS_NAME=$1
BASE_CLASS_NAME=$2
PREFIX=./templates/class

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
    EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    REPL=${CLASS_NAME}

    echo "$EXPR -- $REPL"
    #replace_tag $PREFIX/{class.tmpl}.cpp 'CLASS_NAME' ${CLASS_NAME}
    cat $PREFIX/{class.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > ${CLASS_NAME}.cpp
    cat $PREFIX/{class.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > ${CLASS_NAME}.hpp

    BEG_ESC='\s*/*~\s*'
    END_ESC='\s*~*/\s*'

    # /*~$TAG~*/

    cat script/makefile | sed "s|#PREREQUISTE#|\\$\\(BLD\\)/${CLASS_NAME}.o #PREREQUISTE#|g" > script/makefile.tmp 

    # try to update makefile with new rule
    MAKE_RULE=$(cat script/make.class.snip.tmpl | sed -E "s|/\\*~\\$\\{CLASS_NAME\\}~\\*/|${CLASS_NAME}|g")
    # make a backup of makefile for now
    cat script/makefile.tmp | sed -E "s|#AUTO_INSERT_POINT_DO_NOT_REMOVE#|${MAKE_RULE}\n#AUTO_INSERT_POINT_DO_NOT_REMOVE#|g" > script/my_makefile
    
    #rm  makefile
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




