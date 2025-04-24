<?php
    # make rule
    ?>

$(BLD)/<?php echo $CLASSNAME ?>.o: $(SRC)/<?php echo $CLASSNAME ?>.cpp
    $(CXX) $(CXXFLAGS) -c $(SRC)/<?php echo $CLASSNAME ?>.cpp -o $(BLD)/<?php echo $CLASSNAME ?>.o
