# File:  ./makefile
# Date: Sun May 26 10:57:08 PM CDT 2024
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17 -DDEBUG -g
APP_NAME=#\*~${APP_NAME}~*\#
BLD=build
OBJ=build
SRC=src

all: $(BLD)/#\*~${APP_NAME}~*\#

$(BLD)/#\*~${APP_NAME}~*\#: $(OBJ)/#\*~${APP_NAME}~*\#.o #PREREQUISTE#
	 $(CXX) $(CXXFLAGS) $(OBJ)/#\*~${APP_NAME}~*\#.o -o $(BLD)/#\*~${APP_NAME}~*\#

$(OBJ)/#\*~${APP_NAME}~*\#.o: $(SRC)/#\*~${APP_NAME}~*\#.cpp
	$(CXX) $(CXXFLAGS) -c $(SRC)/#\*~${APP_NAME}~*\#.cpp -o $(OBJ)/#\*~${APP_NAME}~*\#.o

#AUTO_INSERT_POINT_DO_NOT_REMOVE#

.PHONY: clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
