# @name     aaa
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:19:57 PM
# @version: version 0.0.1

# g++ warnings
#-Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror -Wundef
#-fsanitize=undefined,address -Wfloat-equal -Wformat-nonliteral
#-Wformat-security -Wformat-y2k -Wformat=2 -Wimport -Winvalid-pch
#-Wlogical-op -Wmissing-declarations -Wmissing-field-initializers
#-Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn
#-Wnested-externs -Wpacked -Wpointer-arith -Wredundant-decls
#-Wstack-protector -Wstrict-null-sentinel -Wswitch-enum -Wwrite-strings

SHELL:=bash

APP=aaa
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

.PHONY all: help
all: $(BLD)/aaa $(BLD)/libaaa.so $(BLD)/libaaa.a

$(BLD)/aaa: $(OBJ)/main.o $(OBJ)/aaa.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(OBJ)/main.o $(BLD)/aaa $(OBJ)/aaa.o #CCSK_PREREQUISTE#

$(BLD)/libaaa.so: $(OBJ)/main.o $(BLD)/aaa.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/aaa.o -o $(BLD)/libaaa.so
	-chmod 755 $(BLD)/libaaa.so

$(BLD)/libaaa.a: $(OBJ)/main.o $(BLD)/aaa.o
	-ar rvs $(BLD)/libaaa.a $(OBJ)/main.o $(BLD)/aaa.o
	-chmod 755 $(BLD)/libaaa.a

$(OBJ)/aaa.o: $(SRC)/aaa.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/aaa.cpp -o $(OBJ)/aaa.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/aaa ./$(prefix)/bin/aaa
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/aaa
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: aaa; : version 0.0.1 : Sat, Sep 20, 2025  2:19:57 PM simple "aaa" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/aaa:         - re/build aaa'
	@echo  '*        $(BLD)/aaa_utest:   - re/build aaa_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
