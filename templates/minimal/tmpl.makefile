# File:  ./makefile
# Date: \*~${DATE}~*\
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17 -DDEBUG -g
APP_NAME=\*~${APP_NAME}~*\
BLD=build
OBJ=build
SRC=src

all: $(BLD)/\*~${APP_NAME}~*\

$(BLD)/\*~${APP_NAME}~*\: $(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(BLD)/\*~${APP_NAME}~*\ $(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#

$(OBJ)/\*~${APP_NAME}~*\.o: $(SRC)/\*~${APP_NAME}~*\.cpp
	$(CXX) $(CXXFLAGS) -c $(SRC)/\*~${APP_NAME}~*\.cpp -o $(OBJ)/\*~${APP_NAME}~*\.o

#CCSK_RULE#

.PHONY: clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
