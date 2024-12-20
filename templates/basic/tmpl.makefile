# File:  ./makefile
# Date: \*~${DATE}~*\
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17 -DDEBUG -g
APP_NAME=\*~${APP_NAME}~*\
BLD=build
OBJ=build
SRC=src

all: $(BLD)/\*~${APP_NAME}~*\ $(BLD)/lib\*~${APP_NAME}~*\.so $(BLD)/lib\*~${APP_NAME}~*\.a

$(BLD)/\*~${APP_NAME}~*\: $(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#
	 $(CXX) $(CXXFLAGS) -o $(BLD)/\*~${APP_NAME}~*\ $(OBJ)/\*~${APP_NAME}~*\.o #CCSK_PREREQUISTE#

$(BLD)/lib\*~${APP_NAME}~*\.so: $(BLD)/\*~${APP_NAME}~*\.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) -fPIC --shared $(BLD)/\*~${APP_NAME}~*\.o -o $(BLD)/lib\*~${APP_NAME}~*\.so
	chmod 755 $(BLD)/lib\*~${APP_NAME}~*\.so

$(BLD)/lib\*~${APP_NAME}~*\.a: $(BLD)/\*~${APP_NAME}~*\.o
	ar rvs $(BLD)/lib\*~${APP_NAME}~*\.a $(BLD)/\*~${APP_NAME}~*\.o
	chmod 755 $(BLD)/lib\*~${APP_NAME}~*\.a

$(OBJ)/\*~${APP_NAME}~*\.o: $(SRC)/\*~${APP_NAME}~*\.cpp
	$(CXX) $(CXXFLAGS) -fPIC -c $(SRC)/\*~${APP_NAME}~*\.cpp -o $(OBJ)/\*~${APP_NAME}~*\.o

#CCSK_RULE#

.PHONY: clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
