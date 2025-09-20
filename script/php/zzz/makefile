# @name     zzz
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:14:21 PM
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

APP=zzz
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
all: $(BLD)/zzz $(BLD)/libzzz.so $(BLD)/libzzz.a

$(BLD)/zzz: $(OBJ)/main.o $(OBJ)/zzz.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(OBJ)/main.o $(BLD)/zzz $(OBJ)/zzz.o #CCSK_PREREQUISTE#

$(BLD)/libzzz.so: $(OBJ)/main.o $(BLD)/zzz.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/zzz.o -o $(BLD)/libzzz.so
	-chmod 755 $(BLD)/libzzz.so

$(BLD)/libzzz.a: $(OBJ)/main.o $(BLD)/zzz.o
	-ar rvs $(BLD)/libzzz.a $(OBJ)/main.o $(BLD)/zzz.o
	-chmod 755 $(BLD)/libzzz.a

$(OBJ)/zzz.o: $(SRC)/zzz.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/zzz.cpp -o $(OBJ)/zzz.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/zzz ./$(prefix)/bin/zzz
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/zzz
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: zzz; : version 0.0.1 : Sat, Sep 20, 2025  2:14:21 PM simple "zzz" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/zzz:         - re/build zzz'
	@echo  '*        $(BLD)/zzz_utest:   - re/build zzz_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
