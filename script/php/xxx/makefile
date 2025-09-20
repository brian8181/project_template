# @name     xxx
# @file:    makefile
# @date:    Sat, Sep 20, 2025  2:26:15 PM
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

APP=xxx
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
all: $(BLD)/xxx $(BLD)/libxxx.so $(BLD)/libxxx.a

$(BLD)/xxx: $(OBJ)/main.o $(OBJ)/xxx.o
	 $(CXX) $(CXXFLAGS) $(OBJ)/main.o $(OBJ)/xxx.o -o $(BLD)/xxx
$(BLD)/libxxx.so: $(OBJ)/main.o $(BLD)/xxx.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/xxx.o -o $(BLD)/libxxx.so
	-chmod 755 $(BLD)/libxxx.so

$(BLD)/libxxx.a: $(OBJ)/main.o $(BLD)/xxx.o
	-ar rvs $(BLD)/libxxx.a $(OBJ)/main.o $(BLD)/xxx.o
	-chmod 755 $(BLD)/libxxx.a

$(OBJ)/xxx.o: $(SRC)/xxx.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/xxx.cpp -o $(OBJ)/xxx.o

# new rules <?php echo "\nNEW RULE TEST\n ?>
$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/xxx ./$(prefix)/bin/xxx
.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/xxx
.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: xxx; : version 0.0.1 : Sat, Sep 20, 2025  2:26:15 PM simple "xxx" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/xxx:         - re/build xxx'
	@echo  '*        $(BLD)/xxx_utest:   - re/build xxx_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
