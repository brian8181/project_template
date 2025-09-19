<?php
	/*
    *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
	if($argv[1] == '--help' || $argv[1] == '-h')
	{
		echo "\n";
		echo "cssk : @date Fri Sep 19 08:08:55 CDT 2025 : @version 0.0.1\n";
		echo "\n";
		echo "Usage:\n";
		echo "ccsk [options] <name> <date> <version>\n\n";
		exit(0);
	}
    $CLASS_NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];
    ?>
/**
 * @file <?php echo "$CLASS_NAME" ?>.hpp
 * @version <?php echo "$VERSION\n" ?>
 * @date <?php echo "\n" ?>
 * @brief Smart pointer implementation with reference counting.
 */

#ifndef _<?php echo $CLASS_NAME ?>_HPP_
#define _<?php echo $CLASS_NAME ?>_HPP_

/**
  * @brief class <?php echo "$CLASS_NAME\n"; ?>
  */
class <?php echo $CLASS_NAME ?>
{
public:
	<?php echo $CLASS_NAME ?>();
	<?php echo $CLASS_NAME ?>( const <?php echo $CLASS_NAME ?>& src );
	bool operator<( const <?php echo $CLASS_NAME ?>& that );
	virtual ~<?php echo $CLASS_NAME ?>();

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
