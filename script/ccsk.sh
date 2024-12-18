#!/bin/bash

CLASS_NAME=$1
BASE_CLASS_NAME=
PREFIX=$HOME/bin/templates/class

# BEG_ESC='\s*[[~\s*'
# END_ESC='\s*~]]\s*'
BEG_ESC='\s*/*~\s*'
END_ESC='\s*~*/\s*'

function AppendMakeRule
{
    local CLASS_NAME=$1
    local EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    # add prerequistes
    cat makefile | sed "s|#CCSK_PREREQUISTE#|\\$\\(BLD\\)/${CLASS_NAME}.o #CCSK_PREREQUISTE#|g" > makefile.tmp 
    # add new make rule
    cat makefile.tmp | sed -E "s|#CCSK_RULE#|$(cat $PREFIX/make.rule.frag | sed -E "s|$EXPR|${CLASS_NAME}|g")\n#CCSK_RULE#|g" > makefile
    rm makefile.tmp
}

function create_class
{
    local CLASS_NAME=$1
    local EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    local BASE_EXPR="/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/"
    #local REPL=${CLASS_NAME}
    cat $PREFIX/{class.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.cpp
    cat $PREFIX/{class.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.hpp

    AppendMakeRule $CLASS_NAME
}

function create_sub_class
{
    local CLASS_NAME=$1
    local BASE_CLASS_NAME=$2
    local EXPR="/\\*~\\$\\{CLASS_NAME\\}~\\*/"
    local BASE_EXPR="/\\*~\\$\\{BASE_CLASS_NAME\\}~\\*/"
    #local REPL=${CLASS_NAME}

    create_class $BASE_CLASS_NAME
    cat $PREFIX/{class.base.tmpl}.hpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.hpp.tmp
    cat $PREFIX/{class.base.tmpl}.cpp | sed -E "s|$EXPR|${CLASS_NAME}|g" > src/${CLASS_NAME}.cpp.tmp
    cat src/${CLASS_NAME}.hpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > src/${CLASS_NAME}.hpp
    cat src/${CLASS_NAME}.cpp.tmp | sed -E "s|$BASE_EXPR|${BASE_CLASS_NAME}|g" > src/${CLASS_NAME}.cpp

    AppendMakeRule $CLASS_NAME
}

if [ ! -f ".project" ]; then
    echo "error: not a project directory!"
    exit 1;
fi

for name in "$@"; do 

    class=${name##*:}
    echo "'class=' is $class"
    base=${name%%:*}
    echo "'base=' is $base"

    if [ "$class" = "$base" ]; then
        base=
    fi

    if [ -f "./src/${class}.hpp" ] || [ -f "./src/${class}.cpp" ]; then
        echo "class \"$class\" exist" 
        continue
    fi

    if [[ -z "$base" ]]; then
            # no base class
            create_class $name
        else
            #class &  base class
            create_sub_class $class $base
    fi

done 





