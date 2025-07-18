

# TEST HEADER
# File:  ./makefile
# Date: Sunday 23rd of March 2025 07:22:48 AM
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17
CXXEXTRA=-fPIC
APP_NAME=foobar
BLD=build
OBJ=build
SRC=src
DEBUG=1

ifdef DEBUG
	CXXFLAGS += -g -DDEBUG
endif

all: $(BLD)/foobar $(BLD)/libfoobar.so $(BLD)/libfoobar.a

$(BLD):
	-echo testing ...
	#-if not exist $(BLD) mkdir "./$(BLD)"
	exit 1

$(BLD)/foobar: $(SRC)/foobar.o subclass.o
    $(CXX) $(CXXFLAGS) -c $(SRC)/foobar.o subclass.o -o $(BLD)/foobar.o

$(BLD)/foobar.o: $(SRC)/foobar.cpp subclass.cpp
    $(CXX) $(CXXFLAGS) -c $(SRC)/foobar.cpp subclass.o -o $(BLD)/foobar.o

$(BLD)/libfoobar.so: $(BLD)/foobar.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(BLD)/foobar.o -o $(BLD)/libfoobar.so
	-chmod 755 $(BLD)/libfoobar.so

$(BLD)/libfoobar.a: $(BLD)/foobar.o
	-ar rvs $(BLD)/libfoobar.a $(BLD)/foobar.o
	-chmod 755 $(BLD)/libfoobar.a

$(BLD)/foobar.o: $(SRC)/foobar.cpp
    $(CXX) $(CXXFLAGS) -c $(SRC)/foobar.cpp -o $(BLD)/foobar.o

#TEST
.PHONY: all clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
