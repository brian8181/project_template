<?php
	/*
	*  @brief gnu make file
	*  @file makefile.php
	*  @date Sat, Sep 20, 2025  9:26:21 PM
	*  @version 0.0.1
	*/
    $APPNAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];
    ?>
# @name     <?php echo "$APPNAME\n"; ?>
# @file:    makefile
# @date:    <?php echo "$DATE\n"; ?>
# @version: <?php echo "$VERSION\n"; ?>

build/*
