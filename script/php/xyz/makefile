# @name     xyz
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:21:14 PM
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

APP=xyz
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
all: $(BLD)/xyz $(BLD)/libxyz.so $(BLD)/libxyz.a

$(BLD)/xyz: $(OBJ)/main.o $(OBJ)/xyz.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(OBJ)/main.o $(BLD)/xyz $(OBJ)/xyz.o #CCSK_PREREQUISTE#

$(BLD)/libxyz.so: $(OBJ)/main.o $(BLD)/xyz.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/xyz.o -o $(BLD)/libxyz.so
	-chmod 755 $(BLD)/libxyz.so

$(BLD)/libxyz.a: $(OBJ)/main.o $(BLD)/xyz.o
	-ar rvs $(BLD)/libxyz.a $(OBJ)/main.o $(BLD)/xyz.o
	-chmod 755 $(BLD)/libxyz.a

$(OBJ)/xyz.o: $(SRC)/xyz.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/xyz.cpp -o $(OBJ)/xyz.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/xyz ./$(prefix)/bin/xyz
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/xyz
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: xyz; : version 0.0.1 : Sat, Sep 20, 2025  2:21:14 PM simple "xyz" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/xyz:         - re/build xyz'
	@echo  '*        $(BLD)/xyz_utest:   - re/build xyz_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
