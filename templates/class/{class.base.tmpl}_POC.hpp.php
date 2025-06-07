#ifndef __<?php echo $CLASSNAME ?>_HPP
#define __<?php echo $CLASSNAME ?>_HPP

#include "<?php echo $BASENAME ?>.hpp"

class <?php echo $CLASSNAME ?> : public <?php echo $BASENAME ?>
{

public:
	
	<?php 
		if($CTOR)
		{
			?>
			<?php echo $CLASSNAME ?>();
			<?php
		}
		?>

	<?php 
		if($DTOR)
		{
			?>
			virtual ~<?php echo $CLASSNAME ?>();
			<?php
		}
		?>

`	<?php 
		if($COPY_CTOR)
		{
			#include "copy_constructor.php"
		}
		?>
	

private:

};

#endif
