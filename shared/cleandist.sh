#!/bin/bash
FILE='{FILE}'
VERSION='{VERSION}'
FILE_DATE='{DATE}'
# AUTHOR='{AUTHOR}'
# EMAIL='{EMAIL}'
# WWW='{WWW}'

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
	# echo ${VERBOSE:+"Author - $AUTHOR"}.
	# echo ${VERBOSE:+"Email - $EMAIL"}.
	# echo ${VERBOSE:+"www - $WWW"}.
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

rm configure Makefile libtool aclocal.m4 compile INSTALL install-sh ltmain.sh config.* Makefile.in depcomp stamp-h1 2>/dev/null
rm -r  autom4te.cache 2>/dev/null

##{ END YOUR CODE  }##

PRINT_INFO "$FILE -> Exiting.   @ $DATE"

