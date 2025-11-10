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
  $DCTOR=$argv[5];
  $IMP_DEFAULTS=$argv[6];
  $VERSION="0.0.1";
	$INFO="auto generated with ccsk, create class skeleton";
	include 'cstyle_file_header.php';
    ?>
#include "<?= "$NAME"; ?>.hpp"

/**
 * @brief : default ctor
 */
<?= "$NAME::$NAME"; ?>() = default;

<?php if($CCTOR == "TRUE"): ?>
/**
  * @brief : copy ctor
  */
<?= "$NAME::$NAME"; ?>( const <?= "$NAME"; ?>& src ) = default;
<?php endif ?>

<?php if($DTOR == "TRUE"): ?>
/**
  * @brief : destructor
  */
<?= "$NAME::~$NAME"; ?>() = default;
<?php endif ?>
