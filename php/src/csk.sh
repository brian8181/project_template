#!/bin/bash

# File Name:  _csk.sh
# Build Date: # File Name:  skel.sh
# Build Date: Sat, Sep 20, 2025  9:24:24 PM
# Version:    0.0.1


FMT_FG_RED='\e[31m'
FMT_FG_GREEN='\e[32m'
FMT_RESET='\e[0m'

DEBUG_MSG="$PRINT_RED_DEBUG: "
INFO_MSG="$PRINT_GREEN_INFO: "
VERBOSE=1
DEBUG=

CMAKE=
CPPUNIT=

OPTSTRING="vht"
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
        t)
            CPPUNIT="TRUE"
            ;;
        c)
            CMAKE="TRUE"
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
INFO=$2
VERSION="version 0.0.1";

mkdir -p "${NAME}"/{src,test,man,doc}
pushd "${NAME}"
touch readme readme.md news copying authors changelog
php $HOME/.config/csk/makefile.php "${NAME}" "$(date)" "version 0.0.1" > makefile
php $HOME/.config/csk/gitignore.php "${NAME}" "$(date)" "version 0.0.1" > .gitignore
php $HOME/.config/csk/CMakeLists.txt.php "${NAME}" > CMakeLists.txt

pushd ./src
touch "${NAME}.hpp" "${NAME}.cpp" "${NAME}_test.hpp" "${NAME}_test.cpp"
php "${HOME}"/.config/csk/main.cpp.php "${NAME}" "$(date)" > main.cpp
php "${HOME}"/.config/csk/app.hpp.php "${NAME}" "$(date)" > "${NAME}.hpp"
php "${HOME}"/.config/csk/app.cpp.php "${NAME}" "$(date)" > "${NAME}.cpp"
php "${HOME}"/.config/csk/bash_color.hpp.php "${NAME}" "$(date)" > bash_color.hpp
php "${HOME}"/.config/csk/config.hpp.php "${NAME}" "$(date)" > config.hpp
popd
popd
