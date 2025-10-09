#!#/bin/php
<?php
	/*
  *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
  $NAME=$argv[1];
  $DTOR=$argv[3];
  $CCTOR=$argv[4];
  $VERSION="0.0.1";
	$INFO="auto generated with ccsk, create class skeleton";
	include 'cstyle_file_header.php';
    ?>
#include "<?php echo "$NAME"; ?>.hpp"

/**
 * @brief : default ctor
 */
<?php echo "$NAME::$NAME"; ?>()
{

}

<?php if($CCTOR == "TRUE"): ?>
/**
  * @brief : copy ctor
  */
<?php echo "$NAME::$NAME"; ?>( const <?php echo "$NAME"; ?>& src )
{

}
<?php endif ?>

<?php if($DTOR == "TRUE"): ?>
/**
  * @brief : destructor
  */
<?php echo "$NAME::~$NAME"; ?>()
{

}
<?php endif ?>
