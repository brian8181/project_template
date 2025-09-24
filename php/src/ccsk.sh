#!/bin/bash

# File Name:  _ccsk.sh
# Build Date: Sat, Sep 20, 2025  9:24:24 PM
# Version:    0.0.1
# Info: create class skeleton

NAME=$1
BASE_NAME=$2

php "$HOME/.config/csk/class.hpp.php" "${NAME}" "${BASE_NAME}" "0.0.1" > "${NAME}.hpp"
php "$HOME/.config/csk/class.cpp.php" "${NAME}" "${BASE_NAME}" "0.0.1" > "${NAME}.cpp"
