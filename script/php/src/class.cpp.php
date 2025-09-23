#!#/bin/php

<?php
	/*
    *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];

	include 'cstyle_file_header.php';
    ?>
#include "<?php echo "$NAME"; ?>.hpp"

<?php echo "$NAME::$NAME"; ?>()
{

}

<?php echo "$NAME::$NAME"; ?>( const <?php echo "$NAME"; ?>& src )
{

}

<?php echo "$NAME::~$NAME"; ?>()
{

}

bool <?php echo "$NAME"; ?>::operator<( const <?php echo "$NAME"; ?>& that )
{

}
