<?
    include_once "make.vars.php"
    include "make.header.php"
    include "make.flags.php"
    ?>


ifdef DEBUG
	CXXFLAGS += -g -DDEBUG
endif

all: $(BLD)/<?php echo $APPNAME ?> $(BLD)/lib<?php echo $APPNAME ?>.so $(BLD)/lib<?php echo $APPNAME ?>.a 

$(BLD):
	-echo testing ...
	#-if not exist $(BLD) mkdir "./$(BLD)"
	exit 1

<?

    include "make.all.php"

    ?>

<?

    // ccsk rules
    include "make.rule.php"

    ?>

#<?php echo "\b\bTEST" ?>

.PHONY: all clean
clean:
	-rm -f $(OBJ)/*.
	-rm -f $(BLD)/*
