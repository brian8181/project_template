$(BLD)/<?php echo $APPNAME ?>: $(SRC)/<?php echo $APPNAME ?>.o <?php echo $DEPENDS ?>.o
    $(CXX) $(CXXFLAGS) -c $(SRC)/<?php echo $APPNAME ?>.o <?php echo $DEPENDS ?>.o -o $(BLD)/<?php echo $APPNAME ?>.o

$(BLD)/<?php echo $APPNAME ?>.o: $(SRC)/<?php echo $APPNAME ?>.cpp <?php echo $DEPENDS ?>.cpp
    $(CXX) $(CXXFLAGS) -c $(SRC)/<?php echo $APPNAME ?>.cpp <?php echo $DEPENDS ?>.o -o $(BLD)/<?php echo $APPNAME ?>.o

$(BLD)/lib<?php echo $APPNAME ?>.so: $(BLD)/<?php echo $APPNAME ?>.o
	$(CXX) $(CXXFLAGS) $(CXXEXTRA) --shared $(BLD)/<?php echo $APPNAME ?>.o -o $(BLD)/lib<?php echo $APPNAME ?>.so
	-chmod 755 $(BLD)/lib<?php echo $APPNAME ?>.so

$(BLD)/lib<?php echo $APPNAME ?>.a: $(BLD)/<?php echo $APPNAME ?>.o
	-ar rvs $(BLD)/lib<?php echo $APPNAME ?>.a $(BLD)/<?php echo $APPNAME ?>.o
	-chmod 755 $(BLD)/lib<?php echo $APPNAME ?>.a
