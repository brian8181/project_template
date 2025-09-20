# @name     abc
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:16:53 PM
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

APP=abc
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
all: $(BLD)/abc $(BLD)/libabc.so $(BLD)/libabc.a

$(BLD)/abc: $(OBJ)/main.o $(OBJ)/abc.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(OBJ)/main.o $(BLD)/abc $(OBJ)/abc.o #CCSK_PREREQUISTE#

$(BLD)/libabc.so: $(OBJ)/main.o $(BLD)/abc.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/abc.o -o $(BLD)/libabc.so
	-chmod 755 $(BLD)/libabc.so

$(BLD)/libabc.a: $(OBJ)/main.o $(BLD)/abc.o
	-ar rvs $(BLD)/libabc.a $(OBJ)/main.o $(BLD)/abc.o
	-chmod 755 $(BLD)/libabc.a

$(OBJ)/abc.o: $(SRC)/abc.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/abc.cpp -o $(OBJ)/abc.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/abc ./$(prefix)/bin/abc
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/abc
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: abc; : version 0.0.1 : Sat, Sep 20, 2025  2:16:53 PM simple "abc" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/abc:         - re/build abc'
	@echo  '*        $(BLD)/abc_utest:   - re/build abc_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
