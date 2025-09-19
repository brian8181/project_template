<?php
	/*
    *  @brief create class skeleton
	*  @file ccsk.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/

    $CLASS_NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION=$argv[3];
    ?>
#ifndef _<?php echo $CLASS_NAME ?>_HPP_
#define _<?php echo $CLASS_NAME ?>_HPP_

class <?php echo $CLASS_NAME ?>
{
public:
	<?php echo $CLASS_NAME ?>();
	<?php echo $CLASS_NAME ?>( const <?php echo $CLASS_NAME ?>& src );
	bool operator<( const <?php echo $CLASS_NAME ?>& that );
	virtual ~<?php echo $CLASS_NAME ?>();

private:
};

#endif
