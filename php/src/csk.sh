#!/bin/bash

# File Name:  _csk.sh
# Build Date: # File Name:  skel.sh
# Build Date: Sat, Sep 20, 2025  9:24:24 PM
# Version:    0.0.1

NAME=$1
INFO=$2
VERSION="version 0.0.1";

mkdir -p "${NAME}"/{src,test,man,doc}
pushd "${NAME}"
touch readme readme.md news copying authors changelog
php $HOME/.config/csk/makefile.php "${NAME}" "$(date)" "version 0.0.1" > makefile
php $HOME/.config/csk/gitignore.php "${NAME}" "$(date)" "version 0.0.1" > .gitignore

pushd ./src
touch "${NAME}.hpp" "${NAME}.cpp" "${NAME}_test.hpp" "${NAME}_test.cpp"
php "${HOME}"/.config/csk/main.cpp.php "${NAME}" "$(date)" > main.cpp
php "${HOME}"/.config/csk/app.hpp.php "${NAME}" "$(date)" > "${NAME}.hpp"
php "${HOME}"/.config/csk/app.cpp.php "${NAME}" "$(date)" > "${NAME}.cpp"
php "${HOME}"/.config/csk/bash_color.hpp.php "${NAME}" "$(date)" > bash_color.hpp
php "${HOME}"/.config/csk/config.hpp.php "${NAME}" "$(date)" > config.hpp
popd
popd
