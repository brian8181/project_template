#!/bin/bash

# @file: ccsk (ccsk.sh)
# @date: Sat, Sep 20, 2025  9:24:24 PM
# @version:    0.0.1
# @info: create class skeleton

FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'

DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=

CMAKE=
CPPUNIT=
DTOR=TRUE
CCTOR=TRUE

OPTSTRING="vcdh"
while getopts ${OPTSTRING} opt; do
    case ${opt} in
        v)
            INFO
            echo -e "${FMT_FG_GREEN}${VERSION}${FMT_FG_RED} ${DEBUG:-debug}${FMT_RESET}"
            exit 0
            ;;
        h)
            HELP
            exit 0;
            ;;
        c)
            CCTOR="TRUE"
            ;;
        d)
            DTOR="TRUE"
            ;;
        :)
            echo "Option -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            exit 1
            ;;
    esac
done
shift $(($OPTIND-1))

NAME=$1
BASE_NAME=$2

php "$HOME/.config/csk/class.hpp.php" "${NAME}" "${BASE_NAME}" "${DTOR}" "${CCTOR}" "0.0.1" | tee "${NAME}.hpp"
php "$HOME/.config/csk/class.cpp.php" "${NAME}" "${BASE_NAME}" "${DTOR}" "${CCTOR}" "0.0.1" | tee "${NAME}.cpp"
