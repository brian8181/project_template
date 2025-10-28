# File Name:  ${APP_NAME}/makefile
# Build Date: Wed Apr 23 22:44:01 CDT 2025
# Version:    0.1.1

# * @File: makefile
# * @Date: Mon Sep  8 00:03:12 CDT 2025
# * @Version: 0.1.0

# g++ warnings
#-Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror -Wundef
#-fsanitize=undefined,address -Wfloat-equal -Wformat-nonliteral
#-Wformat-security -Wformat-y2k -Wformat=2 -Wimport -Winvalid-pch
#-Wlogical-op -Wmissing-declarations -Wmissing-field-initializers
#-Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn
#-Wnested-externs -Wpacked -Wpointer-arith -Wredundant-decls
#-Wstack-protector -Wstrict-null-sentinel -Wswitch-enum -Wwrite-strings

SHELL:=bash

APP=${APP_NAME}
CXX=g++
CXXFLAGS=-Wall -std=c++20 -fPIC -DNDEBUG
CXXEXTRA=-Wno-template-body
CXXCPP?=
LDFLAGS?=
LIBS?=

SRC?=src
BLD?=build
OBJ?=build

# lib settings
LIBS=-L/usr/lib -L/usr/lib64 -L/usr/local/lib -L/usr/local/lib64
INCLUDES=-I/usr/local/include/cppunit/
LDFLAGS=$(INCLUDES) $(LIBS)

ifndef RELEASE
	CXXFLAGS +=-g -DDEBUG
endif

ifdef CYGWIN
	CXXFLAGS +=-DCYGWIN
	LDFLAGS += -lfmt -lcppunit.dll
else
	LDFLAGS += -lfmt -lcppunit
endif

all: ./$(BLD)/abc ./$(BLD)/\*~${APP_NAME}_test~*\ ./$(BLD)/libabc.so ./$(BLD)/libabc.a

rebuild: clean all

./$(BLD)/abc: ./$(OBJ)/abc.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o ./$(BLD)/abc ./$(OBJ)/abc.o #CCSK_PREREQUISTE#

./$(BLD)/\*~${APP_NAME}_test~*\: ./$(OBJ)/\*~${APP_NAME}_test~*\.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o ./$(BLD)/\*~${APP_NAME}_test~*\ ./$(OBJ)/\*~${APP_NAME}_test~*\.o #CCSK_PREREQUISTE#

./$(BLD)/libabc.so: ./$(BLD)/abc.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared ./$(BLD)/abc.o -o ./$(BLD)/libabc.so
	-chmod 755 ./$(BLD)/libabc.so

./$(BLD)/libabc.a: ./$(BLD)/abc.o
	-ar rvs ./$(BLD)/libabc.a ./$(BLD)/abc.o
	-chmod 755 ./$(BLD)/libabc.a

./$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: install
install:
	cp ./$(BLD)/abc ./$(prefix)/bin/abc

.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/abc

.PHONY: clean

clean:
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: $(APP) simple "$(APP)" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/$(APP):         - re/build $(APP)'
	@echo  '*        $(BLD)/$(APP)_utest:   - re/build $(APP)_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
