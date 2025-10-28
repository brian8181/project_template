<?php
	/*
	*  @brief gnu make file
	*  @file makefile.php
	*  @date Sat, Sep 20, 2025  9:26:21 PM
	*  @version 0.0.1
	*/
    $APPNAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];
    ?>
# @name     <?= "$APPNAME\n"; ?>
# @file:    makefile
# @date:    <?= "$DATE\n"; ?>
# @version: <?= "$VERSION\n"; ?>

# g++ warnings
#-Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror -Wundef
#-fsanitize=undefined,address -Wfloat-equal -Wformat-nonliteral
#-Wformat-security -Wformat-y2k -Wformat=2 -Wimport -Winvalid-pch
#-Wlogical-op -Wmissing-declarations -Wmissing-field-initializers
#-Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn
#-Wnested-externs -Wpacked -Wpointer-arith -Wredundant-decls
#-Wstack-protector -Wstrict-null-sentinel -Wswitch-enum -Wwrite-strings

SHELL:=bash

APP=<?= "$APPNAME\n"; ?>
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

all: $(BLD)/<?= $APPNAME; ?> $(BLD)/lib<?= $APPNAME; ?>.so $(BLD)/lib<?= $APPNAME; ?>.a

$(BLD)/<?= $APPNAME; ?>: $(OBJ)/main.o $(OBJ)/<?= $APPNAME; ?>.o
	 $(CXX) $(CXXFLAGS) $(OBJ)/main.o $(OBJ)/<?= $APPNAME; ?>.o -o $(BLD)/<?= $APPNAME; ?>

$(BLD)/lib<?= $APPNAME; ?>.so: $(OBJ)/main.o $(BLD)/<?= $APPNAME; ?>.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(OBJ)/main.o $(BLD)/<?= $APPNAME; ?>.o -o $(BLD)/lib<?= $APPNAME; ?>.so
	-chmod 755 $(BLD)/lib<?= $APPNAME; ?>.so

$(BLD)/lib<?= $APPNAME; ?>.a: $(OBJ)/main.o $(BLD)/<?= $APPNAME; ?>.o
	-ar rvs $(BLD)/lib<?= $APPNAME; ?>.a $(OBJ)/main.o $(BLD)/<?= $APPNAME; ?>.o
	-chmod 755 $(BLD)/lib<?= $APPNAME; ?>.a

$(OBJ)/<?= $APPNAME; ?>.o: $(SRC)/<?= $APPNAME; ?>.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/<?= $APPNAME; ?>.cpp -o $(OBJ)/<?= $APPNAME; ?>.o

# rules <?= '<?= "\nTEST\n ?>' ?>

# copy header to build dir
$(BLD)/%.hpp: $(SRC)/%.hpp
	-cp $^ $@

$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#<?php '<?php echo "rule\n"; include "make.class.rule.php" ?>' ?>

.PHONY: all clean install unintsall rebuild help

rebuild: clean all

install:
	cp ./$(BLD)/<?= $APPNAME; ?> ./$(prefix)/bin/<?= $APPNAME; ?>

uninstall:
	-rm ./$(prefix)/bin/<?= $APPNAME; ?>

clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

help:
	@echo
	@echo  'Project: <?= "$APPNAME; : $VERSION : $DATE" ?> simple "<?= $APPNAME; ?>" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   -Make Targets ...'
	@echo
	@echo  '*        all                                     - build all'
	@echo  '*        $(BLD)/<?= $APPNAME; ?>:         - re/build <?= $APPNAME; ?>'
	@echo  '*        $(BLD)/<?= $APPNAME; ?>_utest:   - re/build <?= $APPNAME; ?>_utest, unit testing'
	@echo  '*        clean                                   - remove most generated files but keep the config'
