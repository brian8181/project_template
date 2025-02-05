<php? # class implementation with bas class  ?>

#include "<?php echo $CLASSNAME ?>.hpp"
<php? # constructor  ?>
<?php echo $CLASSNAME ?>::<?php echo $CLASSNAME ?>()
{

}

<php? # copy constructor  ?>
<?php echo $CLASSNAME ?>::<?php echo $CLASSNAME ?>( const <?php echo $CLASSNAME ?>& src )
{

}

<php? # destructor  ?>
<?php echo $CLASSNAME ?>::~<?php echo $CLASSNAME ?>()
{

}

<php? # lessthan operator  ?>
bool <?php echo $CLASSNAME ?>::operator<( const <?php echo $CLASSNAME ?>& that)
{
    return false;
}

