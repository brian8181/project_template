<?php
	// testing
	?>

CXX=g++
CXXFLAGS=-Wall -std=c++17
CXXEXTRA=-fPIC

# lib settings
LIBS = -L/usr/local/lib/
INCLUDES = -I/usr/local/include/cppunit/
LDFLAGS = $(LIBS) $(INCLUDES)

APP_NAME=<?php echo "$APPNAME\n" ?>
SRC=src
BLD?=build
OBJ?=build

ifndef RELEASE
	CXXFLAGS +=-g -DDEBUG
endif

ifdef CYGWIN
	CXXFLAGS +=-DCYGWIN
endif
