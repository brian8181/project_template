# @name     ccc
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:24:34 PM
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

APP=ccc
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
all: $(BLD)/ccc $(BLD)/libccc.so $(BLD)/libccc.a

$(BLD)/ccc: $(OBJ)/main.o $(OBJ)/ccc.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(OBJ)/main.o $(BLD)/ccc $(OBJ)/ccc.o #CCSK_PREREQUISTE#

$(BLD)/libccc.so: $(OBJ)/main.o $(BLD)/ccc.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/ccc.o -o $(BLD)/libccc.so
	-chmod 755 $(BLD)/libccc.so

$(BLD)/libccc.a: $(OBJ)/main.o $(BLD)/ccc.o
	-ar rvs $(BLD)/libccc.a $(OBJ)/main.o $(BLD)/ccc.o
	-chmod 755 $(BLD)/libccc.a

$(OBJ)/ccc.o: $(SRC)/ccc.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/ccc.cpp -o $(OBJ)/ccc.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/ccc ./$(prefix)/bin/ccc
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/ccc
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: ccc; : version 0.0.1 : Sat, Sep 20, 2025  2:24:34 PM simple "ccc" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/ccc:         - re/build ccc'
	@echo  '*        $(BLD)/ccc_utest:   - re/build ccc_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
