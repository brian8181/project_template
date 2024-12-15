# File Name:  ./makefile
# Build Date: Sun May 26 10:57:08 PM CDT 2024
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17 -DDEBUG -g
APP_NAME=fff
BLD=build
OBJ=build
SRC=src

all: $(BLD)/fff

$(BLD)/fff: $(OBJ)/fff.o #PREREQUISTE#
	 $(CXX) $(CXXFLAGS) $(OBJ)/fff.o -o $(BLD)/fff

$(OBJ)/fff.o: $(SRC)/fff.cpp
	$(CXX) $(CXXFLAGS) -c $(SRC)/fff.cpp -o $(OBJ)/fff.o

#AUTO_INSERT_POINT_DO_NOT_REMOVE#

.PHONY: clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
