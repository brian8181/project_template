<?php
	/*
	*  @brief gnu make file
	*  @file makefile.php
	*  @date Sat, Sep 20, 2025  9:26:21 PM
	*  @version 0.0.1
	*/
    ?>
all: ././$(BLD)/<?= $APPNAME ?> ./$(BLD)/lib<?= $APPNAME ?>.so ./$(BLD)/lib<?= $APPNAME ?>.a

./$(BLD)/<?= $APPNAME ?>: ./$(SRC)/<?= $APPNAME ?>.o main.cpp
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/<?= $APPNAME ?>.o <?= $DEPENDS ?>.o -o ./$(BLD)/<?= $APPNAME ?>

./$(BLD)/<?= $APPNAME ?>_test: ./$(SRC)/<?= $APPNAME ?>_test.o
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/<?= $APPNAME ?>_test.o main.o -o ./$(BLD)/<?= $APPNAME ?>_test

./$(BLD)/lib<?= $APPNAME ?>.so: ./$(BLD)/<?= $APPNAME ?>.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared ./$(BLD)/<?= $APPNAME ?>.o -o ./$(BLD)/lib<?= $APPNAME ?>.so
	-chmod 755 ./$(BLD)/lib<?= $APPNAME ?>.so

./$(BLD)/lib<?= $APPNAME ?>.a: ./$(BLD)/<?= $APPNAME ?>.o
	-ar rvs ./$(BLD)/lib<?= $APPNAME ?>.a ./$(BLD)/<?= $APPNAME ?>.o
	-chmod 755 ./$(BLD)/lib<?= $APPNAME ?>.a

./$(OBJ)/%.o: ././$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o ./$(SRC)/$@ ./$(OBJ)/$<

.PHONY: all clean
clean:
	-rm -f ./$(OBJ)/*.
	-rm -f ./$(BLD)/*
