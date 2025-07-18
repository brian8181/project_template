#!/bin/php

<?php
    $APPNAME=$argv[1];
    //$DEPENDS=$argv[2];
    $CLASSNAME=$APPNAME;
    $DATE=date("l") ;
    ?>

<?php
    include_once "make.header.php";
    //include_once "make.vars.php";
    include_once "make.flags.php";
    ?>

$(BLD):
	-echo testing ...
	#-if not exist $(BLD) mkdir "./$(BLD)"
	exit 1

<?php
    include_once "make.all.php";
    ?>

<?php
	// ccsk rules
	// include "make.class.rule.php";
    ?>

<?php
	//echo "#TEST"
	?>
