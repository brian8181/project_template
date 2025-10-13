#!/bin/php
<?php
	/*
    *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
	$BASE_NAME=$argv[2];
	$DTOR=$argv[3];
	$CCTOR=$argv[4];
    $VERSION="0.0.1";
	$INFO="auto generated with ccsk, create class skeleton";
	include 'cstyle_file_header.php'
    ?>
#ifndef _<?= "$NAME"; ?>_HPP_
#define _<?= "$NAME"; ?>_HPP_
#include <iostream>
<?php if(!empty($BASE_NAME)) echo "#include \"$BASE_NAME.hpp\"\n"; ?>

/**
  * @brief class <?= "$NAME\n"; ?>
  */
class <?= "$NAME"; if(!empty($BASE_NAME)) echo " : public $BASE_NAME"; echo "\n"; ?>
{
public:
	/**
	* @brief : default ctor
	*/
	<?= "$NAME"; ?>();

	<?php if($CCTOR == "TRUE"): ?>
	/**
	* @brief : copy ctor
	*/
	<?= "$NAME"; ?>( const <?= "$NAME"; ?>& src );
	<?php endif ?>

	<?php if($CCTOR == "TRUE"): ?>
	/**
	* @brief : destructor
	*/
	virtual ~<?= "$NAME"; ?>();
	<?php endif ?>

	/**
	<?php
		echo "  * @brief \n\t";
		echo "  * @brief c++ comment ...\n\t";
		echo "  * @brief place future addtions here ...\n\t  *\n";
	?>
	*/

private:

};

#endif
