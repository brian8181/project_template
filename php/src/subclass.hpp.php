#!/bin/bash

<?php
	/*
    *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
    $BASE_NAME=$argv[2];
    $DATE=$argv[3];
	$VERSION=$argv[4];

	include 'cstyle_file_header.php'
    ?>
#ifndef _<?= "$NAME"; ?>_HPP_
#define _<?= "$NAME"; ?>_HPP_

/**
  * @brief class <?= "$NAME\n"; ?>
  */
class <?= "$NAME : public $BASE_NAME\n"; ?>
{
public:
	<?= "$NAME"; ?>();
	<?= "$NAME"; ?>( const <?= "$NAME"; ?>& src );
	virtual ~<?= "$NAME"; ?>();
	bool operator<( const <?= "$NAME"; ?>& that );

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
