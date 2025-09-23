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
#ifndef _<?php echo "$NAME"; ?>_HPP_
#define _<?php echo "$NAME"; ?>_HPP_

/**
  * @brief class <?php echo "$NAME\n"; ?>
  */
class <?php echo "$NAME"; if(isset($BASE_NAME)) echo " : public $BASE_NAME\n"; ?>
{
public:
	<?php echo "$NAME"; ?>();
	<?php echo "$NAME"; ?>( const <?php echo "$NAME"; ?>& src );
	virtual ~<?php echo "$NAME"; ?>();
	bool operator<( const <?php echo "$NAME"; ?>& that );

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
