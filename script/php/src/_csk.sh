#!/bin/bash

# File Name:  _csk.sh
# Build Date: # File Name:  skel.sh
# Build Date: Sat, Sep 20, 2025  9:24:24 PM
# Version:    0.0.1

NAME=$1
INFO=$2
VERSION="version 0.0.1";

mkdir -p ${NAME}/{src,test,man,doc}
pushd ${NAME}

touch readme readme.md news copying authors changelog
php ~/bin/skel/makefile.php "${NAME}" "$(date)" "version 0.0.1" > makefile
php ~/bin/skel/gitignore.php "${NAME}" "$(date)" "version 0.0.1" > .gitignore

pushd ./src
touch ${NAME}.hpp ${NAME}.cpp ${NAME}_test.hpp ${NAME}_test.cpp
php ~/bin/skel/main_cpp.php "${NAME}" "$(date)" > main.cpp
php ~/bin/skel/app_hpp.php "${NAME}" "$(date)" > ${NAME}.hpp
php ~/bin/skel/app_cpp.php "${NAME}" "$(date)" > ${NAME}.cpp
php ~/bin/skel/bash_color_hpp.php "${NAME}" "$(date)" > bash_color.hpp
php ~/bin/skel/config_hpp.php "${NAME}" "$(date)" > config.hpp

popd
popd
