#!/bin/php

<?php
    $APPNAME=$argv[1];
    $DEPENDS=$argv[2];
    $CLASSNAME=$APPNAME;
    $DATE=date("l") ;
    ?>

<?php
    include_once "make.header.php";
    include_once "make.vars.php";
    include_once "make.flags.php";
    ?>

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

<?php echo "#TEST" ?>

.PHONY: all clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
