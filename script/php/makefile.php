<?php
	/*
	*  @file mkm.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/

    $APPNAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];
    ?>
# @name     <?php echo "$APPNAME\n"; ?>
# @file:    makefile
# @date:    <?php echo "$DATE\n"; ?>
# @version: <?php echo "$VERSION\n"; ?>

# g++ warnings
#-Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror -Wundef
#-fsanitize=undefined,address -Wfloat-equal -Wformat-nonliteral
#-Wformat-security -Wformat-y2k -Wformat=2 -Wimport -Winvalid-pch
#-Wlogical-op -Wmissing-declarations -Wmissing-field-initializers
#-Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn
#-Wnested-externs -Wpacked -Wpointer-arith -Wredundant-decls
#-Wstack-protector -Wstrict-null-sentinel -Wswitch-enum -Wwrite-strings

SHELL:=bash

APP=<?php echo $APPNAME ?>
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
all: $(BLD)/<?php echo $APPNAME ?> $(BLD)/lib<?php echo $APPNAME ?>.so $(BLD)/lib<?php echo $APPNAME ?>.a

$(BLD)/<?php echo $APPNAME ?>: $(OBJ)/<?php echo $APPNAME ?>.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(BLD)/<?php echo $APPNAME ?> $(OBJ)/<?php echo $APPNAME ?>.o #CCSK_PREREQUISTE#

$(BLD)/lib<?php echo $APPNAME ?>.so: $(BLD)/<?php echo $APPNAME ?>.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(BLD)/<?php echo $APPNAME ?>.o -o $(BLD)/lib<?php echo $APPNAME ?>.so
	-chmod 755 $(BLD)/lib<?php echo $APPNAME ?>.so

$(BLD)/lib<?php echo $APPNAME ?>.a: $(BLD)/<?php echo $APPNAME ?>.o
	-ar rvs $(BLD)/lib<?php echo $APPNAME ?>.a $(BLD)/<?php echo $APPNAME ?>.o
	-chmod 755 $(BLD)/lib<?php echo $APPNAME ?>.a

$(OBJ)/<?php echo $APPNAME ?>.o: $(SRC)/<?php echo $APPNAME ?>.cpp
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -c $(SRC)/<?php echo $APPNAME ?>.cpp -o $(OBJ)/<?php echo $APPNAME ?>.o

# new rules <?php echo '<?php echo "\nNEW RULE TEST\n ?>' ?>

$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: rebuild clean
rebuild: clean all

.PHONY: install
install:
	cp ./$(BLD)/<?php echo $APPNAME ?> ./$(prefix)/bin/<?php echo $APPNAME ?>

.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/<?php echo $APPNAME ?>

.PHONY: clean
clean:
	@ECHO "removing files ..."
	-rm -f $(OBJ)/*
	-rm -f $(BLD)/*

.PHONY: help
help:
	@echo
	@echo  'Project: <?php echo "$APPNAME : $VERSION : $DATE" ?> simple "<?php echo $APPNAME ?>" framework.'
	@echo
	@echo  '    make [-f] [target]'
	@echo
	@echo  '   *make targets ...'
	@echo
	@echo  '*        all                    - build all'
	@echo  '*        $(BLD)/<?php echo $APPNAME ?>:         - re/build <?php echo $APPNAME ?>'
	@echo  '*        $(BLD)/<?php echo $APPNAME ?>_utest:   - re/build <?php echo $APPNAME ?>_utest, unit testing'
	@echo  '*        clean                  - remove most generated files but keep the config'
