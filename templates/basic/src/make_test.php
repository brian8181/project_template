#!/bin/php

<?php 
	  $APPNAME=$argv[1];
	  $DEPENDS=$argv[2];
	  $CLASSNAME=$APPNAME;
      
      include_once "make.header.php";
      echo "\n";
      include_once "make.vars.php";
      include_once "make.flags.php";
      include_once "make.libs.php";
      include_once "make.link.php";
      // add all
      include "make.all.php";
?>

