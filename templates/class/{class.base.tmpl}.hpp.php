<php? # basic class definition with base class  ?>

#ifndef __<?php echo $CLASSNAME ?>_HPP
#define __<?php echo $CLASSNAME ?>_HPP

#include "<?php echo $BASENAME ?>.hpp"

class <?php echo $CLASSNAME ?> : public <?php echo $BASENAME ?>
{

public:
	<?php echo $CLASSNAME ?>();
	virtual ~<?php echo $CLASSNAME ?>();

	<?php 
		
		if( $COPY_CTOR )
		{
			include_once "copy_constructor.php" 
		}

		?>
private:

};

#endif
