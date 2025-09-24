<?php
	/*
    *  @brief # main with getlongopts
	*  @file main_get_long_opts.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    ?>
<?php
    # make rule
    ?>

$(BLD)/<?php echo $CLASSNAME ?>.o: $(SRC)/<?php echo $CLASSNAME ?>.cpp
    $(CXX) $(CXXFLAGS) -c $(SRC)/<?php echo $CLASSNAME ?>.cpp -o $(BLD)/<?php echo $CLASSNAME ?>.o
