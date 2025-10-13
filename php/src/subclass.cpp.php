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
	$INFO=$argv[4];

	include 'cstyle_file_header.php';
    ?>
#include "<?= "$NAME"; ?>.hpp"

<?= "$NAME::$NAME"; ?>()
{

}

<?= "$NAME::$NAME"; ?>( const <?= "$NAME"; ?>& src )
{

}

<?= "$NAME::~$NAME"; ?>()
{

}

bool <?= "$NAME"; ?>::operator<( const <?= "$NAME"; ?>& that )
{

}
