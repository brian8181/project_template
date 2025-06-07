
all: ././$(BLD)/<?php echo $APPNAME ?> ./$(BLD)/lib<?php echo $APPNAME ?>.so ./$(BLD)/lib<?php echo $APPNAME ?>.a

./$(BLD)/<?php echo $APPNAME ?>: ./$(SRC)/<?php echo $APPNAME ?>.o <?php echo $DEPENDS ?>.cpp
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/<?php echo $APPNAME ?>.o <?php echo $DEPENDS ?>.o -o ./$(BLD)/<?php echo $APPNAME ?>

./$(BLD)/<?php echo $APPNAME ?>_test: ./$(SRC)/<?php echo $APPNAME ?>_test.o
    $(CXX) $(CXXFLAGS) -c ./$(SRC)/<?php echo $APPNAME ?>_test.o <?php echo $DEPENDS ?>.o -o ./$(BLD)/<?php echo $APPNAME ?>_test

./$(BLD)/lib<?php echo $APPNAME ?>.so: ./$(BLD)/<?php echo $APPNAME ?>.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared ./$(BLD)/<?php echo $APPNAME ?>.o -o ./$(BLD)/lib<?php echo $APPNAME ?>.so
	-chmod 755 ./$(BLD)/lib<?php echo $APPNAME ?>.so

./$(BLD)/lib<?php echo $APPNAME ?>.a: ./$(BLD)/<?php echo $APPNAME ?>.o
	-ar rvs ./$(BLD)/lib<?php echo $APPNAME ?>.a ./$(BLD)/<?php echo $APPNAME ?>.o
	-chmod 755 ./$(BLD)/lib<?php echo $APPNAME ?>.a

./$(OBJ)/%.o: ././$(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o ./$(SRC)/$@ ./$(OBJ)/$<

.PHONY: all clean
clean:
	-rm -f ./$(OBJ)/*.
	-rm -f ./$(BLD)/*
