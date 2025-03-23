<?php
	// testing
	?>

CXX=g++
CXXFLAGS=-Wall -std=c++17
CXXEXTRA=-fPIC
APP_NAME=<?php echo "$APPNAME\n" ?>
BLD=build
OBJ=build
SRC=src
DEBUG=1

ifdef DEBUG
	CXXFLAGS += -g -DDEBUG
endif
