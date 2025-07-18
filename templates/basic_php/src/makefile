


# File:  ./makefile
# Date: Friday 18th of July 2025 08:58:40 AM
# Version:    0.1.0

CXX=g++
CXXFLAGS=-Wall -std=c++17
CXXEXTRA=-fPIC
APP_NAME=
BLD=build
OBJ=build
SRC=src
DEBUG=1

ifdef DEBUG
	CXXFLAGS +=-g -DDEBUG
endif

ifdef CYGWIN
	CXXFLAGS += -DCYGWIN
endif

$(BLD):
	-echo testing ...
	#-if not exist $(BLD) mkdir "./$(BLD)"
	exit 1


all: ././$(BLD)/ ./$(BLD)/lib.so ./$(BLD)/lib.a

./$(BLD)/: ./$(SRC)/.o .cpp
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/.o .o -o ./$(BLD)/
./$(BLD)/_test: ./$(SRC)/_test.o
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/_test.o .o -o ./$(BLD)/_test

./$(BLD)/lib.so: ./$(BLD)/.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared ./$(BLD)/.o -o ./$(BLD)/lib.so
	-chmod 755 ./$(BLD)/lib.so

./$(BLD)/lib.a: ./$(BLD)/.o
	-ar rvs ./$(BLD)/lib.a ./$(BLD)/.o
	-chmod 755 ./$(BLD)/lib.a

./$(OBJ)/%.o: ././$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o ./$(SRC)/$@ ./$(OBJ)/$<

.PHONY: all clean
clean:
	-rm -f ./$(OBJ)/*.
	-rm -f ./$(BLD)/*


