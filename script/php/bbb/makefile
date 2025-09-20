# @name     bbb
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:22:38 PM
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

APP=bbb
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
all: $(BLD)/bbb $(BLD)/libbbb.so $(BLD)/libbbb.a

$(BLD)/bbb: $(OBJ)/main.o $(OBJ)/bbb.o
	 $(CXX) $(CXXFLAGS) $(OBJ)/main.o $(OBJ)/bbb.o -o $(BLD)/bbb

$(BLD)/libbbb.so: $(OBJ)/main.o $(BLD)/bbb.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/bbb.o -o $(BLD)/libbbb.so
	-chmod 755 $(BLD)/libbbb.so

$(BLD)/libbbb.a: $(OBJ)/main.o $(BLD)/bbb.o
	-ar rvs $(BLD)/libbbb.a $(OBJ)/main.o $(BLD)/bbb.o
	-chmod 755 $(BLD)/libbbb.a

$(OBJ)/bbb.o: $(SRC)/bbb.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/bbb.cpp -o $(OBJ)/bbb.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/bbb ./$(prefix)/bin/bbb
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/bbb
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: bbb; : version 0.0.1 : Sat, Sep 20, 2025  2:22:38 PM simple "bbb" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/bbb:         - re/build bbb'
	@echo  '*        $(BLD)/bbb_utest:   - re/build bbb_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
