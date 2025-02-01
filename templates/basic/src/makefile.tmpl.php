<<<<<<< HEAD
#!/bin/php

<?php
    $APPNAME=$argv[1];
    $DEPENDS=$argv[2];
    $CLASSNAME=$APPNAME;
    $DATE=date("l") ;
    ?>

<?php
    include_once "make.vars.php";
    include "make.header.php";
    include "make.flags.php";
=======
<php? # make template ?>

<?
    include_once "make.vars.php"
    include "make.header.php"
    include "make.flags.php"
>>>>>>> a49a0a10ef28fff82fb177765bc0093e17e8fcaf
    ?>


ifdef DEBUG
	CXXFLAGS += -g -DDEBUG
endif

all: $(BLD)/<?php echo $APPNAME ?> $(BLD)/lib<?php echo $APPNAME ?>.so $(BLD)/lib<?php echo $APPNAME ?>.a 

$(BLD):
	-echo testing ...
	#-if not exist $(BLD) mkdir "./$(BLD)"
	exit 1

<?php

    include "make.all.php";

    ?>

<?php

    // ccsk rules
    include "make.rule.php";

    ?>

#<?php echo "\b\bTEST" ?>

.PHONY: all clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
