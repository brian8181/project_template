<php? # basic class definition ?>

#ifndef __<?php echo $CLASSNAME ?>_HPP
#define __<?php echo $CLASSNAME ?>_HPP

class <?php echo $CLASSNAME ?>
{

public:
	<?php echo $CLASSNAME ?>();
	<?php echo $CLASSNAME ?>( const <?php echo $CLASSNAME ?>& src );
	bool operator<( const <?php echo $CLASSNAME ?>& that );
	virtual ~<?php echo $CLASSNAME ?>();

private:

};

#endif
