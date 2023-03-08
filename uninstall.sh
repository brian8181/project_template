#!/bin/bash
FILE='uninstall.sh'
VERSION='0.1.6'
FILE_DATE='March 8, 2030'

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'
PRINT_RED_DEBUG=${FMT_FG_RED}DEBUG${FMT_RESET}
PRINT_GREEN_INFO=${FMT_FG_GREEN}INFO${FMT_RESET}
DATE=$(date "+%H:%M:%S:%s")

# USER SETTING
DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=1
# END

if [ -n $VERBOSE ]
then
	echo ${VERBOSE:+"File - $FILE"}.
	echo ${VERBOSE:+"Version - $VERSION"}.
	echo ${VERBOSE:+"Date - $FILE_DATE"}.
fi

function PRINT_DEBUG
{
    MSG=${DEBUG_MSG}$1
    echo -e ${DEBUG:+"$MSG"}
}

function PRINT_INFO
{
    MSG=${INFO_MSG}$1
    echo -e ${VERBOSE:+"$MSG"}
}

PRINT_INFO "$FILE -> Running... @ $DATE"
##{ BEGIN YOUR CODE  }##

PRINT_INFO "remove existing project templates ..."
# remove "project_templates" before update
rm -rf ~/bin/project_templates

PRINT_INFO "remove existing project scripts ..."
# remove old scripts & links
rm ~/bin/skel.sh  2> /dev/null # possible error
rm ~/bin/csk.sh 2> /dev/null   # possible error
rm ~/bin/csk 2> /dev/null      # possible error

PRINT_INFO "remove existing class templates ..."
# remove old scripts
rm ~/bin/ccl 2>/dev/null                  # possible error
rm ~/bin/ccl2 2>/dev/null                 # possible error
rm ~/bin/create.class.sh 2>/dev/null      # possible error
rm ~/bin/run.create.class.sh 2>/dev/null  # possible error
rm ~/bin/class.?pp.tmpl 2>/dev/null       # possible error
rm ~/bin/class.base.?pp.tmpl 2>/dev/null   # possible error

##{ END YOUR CODE  }##
PRINT_INFO "$FILE -> Exiting.   @ $DATE"
