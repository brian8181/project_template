# File Name:  ${APP_NAME}/makefile
# Build Date: Wed Apr 23 22:44:01 CDT 2025
# Version:    0.1.1

APP=${APP_NAME}
CXX=g++
CXXFLAGS=-Wall -std=c++20
SRC=src
BLD?=build
OBJ?=build

# lib settings
LDFLAGS = -static -lcppunit -L/usr/local/lib/
INCLUDES = -I/usr/local/include/cppunit/

ifdef DEBUG
	CXXFLAGS +=-g -DDEBUG
endif

ifdef CYGWIN
	CXXFLAGS += -DCYGWIN
endif

all: ./$(BLD)/\*~${APP_NAME}~*\ ./$(BLD)/\*~${APP_NAME}_test~*\ ./$(BLD)/lib\*~${APP_NAME}~*\.so ./$(BLD)/lib\*~${APP_NAME}~*\.a

rebuild: clean all

./$(BLD)/\*~${APP_NAME}~*\: ./$(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o ./$(BLD)/\*~${APP_NAME}~*\ ./$(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#

./$(BLD)/\*~${APP_NAME}_test~*\: ./$(OBJ)/\*~${APP_NAME}_test~*\.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o ./$(BLD)/\*~${APP_NAME}_test~*\ ./$(OBJ)/\*~${APP_NAME}_test~*\.o #CCSK_PREREQUISTE#

./$(BLD)/lib\*~${APP_NAME}~*\.so: ./$(BLD)/\*~${APP_NAME}~*\.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared ./$(BLD)/\*~${APP_NAME}~*\.o -o ./$(BLD)/lib\*~${APP_NAME}~*\.so
	-chmod 755 ./$(BLD)/lib\*~${APP_NAME}~*\.so

./$(BLD)/lib\*~${APP_NAME}~*\.a: ./$(BLD)/\*~${APP_NAME}~*\.o
	-ar rvs ./$(BLD)/lib\*~${APP_NAME}~*\.a ./$(BLD)/\*~${APP_NAME}~*\.o
	-chmod 755 ./$(BLD)/lib\*~${APP_NAME}~*\.a

./$(OBJ)/%.o: ./$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#CCSK_RULE#

.PHONY: install
install:
	cp ./$(BLD)/\*~${APP_NAME}~*\ ./$(prefix)/bin/\*~${APP_NAME}~*\

.PHONY: uninstall
uninstall:
	-rm ./$(prefix)/bin/\*~${APP_NAME}~*\

.PHONY: clean
clean:
	-rm -f ./$(OBJ)/*.o
	-rm -f ./$(BLD)/*.o
	-rm -f ./$(BLD)/\*~${APP_NAME}~*\*


.PHONY: help
help:
	@echo  '  all         - build all'
	@echo  '  \*~${APP_NAME}~*\          - build \*~${APP_NAME}~*\ executable'
	@echo  '  \*~${APP_NAME}~*\.o        - build not link'
	@echo  '  \*~${APP_NAME}~*\_test     - build cppunit test'
	@echo  '  \*~${APP_NAME}~*\_test.o   - build cppunit test'
	@echo  '  clean                      - remove all files from build dir'
	@echo  '  install                    - copy files to usr/local'
	@echo  '  dist                       - create distribution, tar.gz'
