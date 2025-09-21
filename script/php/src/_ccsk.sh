#!/bin/bash

# File Name:  _ccsk.sh
# Build Date: Sat, Sep 20, 2025  9:24:24 PM
# Version:    0.0.1
# Info: create class skeleton

NAME=$1
INFO=$2

php ./ccsk.php "${NAME}" "$(date)" "version 0.0.1" "${INFO}"
