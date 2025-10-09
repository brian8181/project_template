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
#ifndef _<?php echo "$NAME"; ?>_HPP_
#define _<?php echo "$NAME"; ?>_HPP_
#include <iostream>
<?php if(!empty($BASE_NAME)) echo "#include \"$BASE_NAME.hpp\"\n"; ?>

/**
  * @brief class <?php echo "$NAME\n"; ?>
  */
class <?php echo "$NAME"; if(!empty($BASE_NAME)) echo " : public $BASE_NAME"; echo "\n"; ?>
{
public:
	/**
	* @brief : default ctor
	*/
	<?php echo "$NAME"; ?>();

	<?php if($CCTOR == "TRUE"): ?>
	/**
	* @brief : copy ctor
	*/
	<?php echo "$NAME"; ?>( const <?php echo "$NAME"; ?>& src );
	<?php endif ?>

	<?php if($CCTOR == "TRUE"): ?>
	/**
	* @brief : destructor
	*/
	virtual ~<?php echo "$NAME"; ?>();
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
