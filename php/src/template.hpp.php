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
template< class T>
class <?php echo "$NAME"; if(!empty($BASE_NAME)) echo " : public $BASE_NAME"; echo "\n"; ?>
{
public:
    /**
     * @brief : default ctor
     */
    <?php echo "$NAME"; ?>()
    {

    }

    /**
     * @brief : copy ctor
     */
    <?php echo "$NAME"; ?>( const <?php echo "$NAME"; ?>& src )
    {

    }

    /**
     * @brief : destructor
     */
    virtual ~<?php echo "$NAME"; ?>()
    {

    }

    /**
     *  @name : get_val
     *  @param : none`
     *  @return : T
     */
    T get_val()
    {
        return _val;
    }

    /**
     *  @name : set_val
     *  @param : const T& val
     *  @return : void
     */
    void set_val(const T& val)
    {
        _val = val;
    }

	/**
	<?php
		echo "  * @brief \n\t";
		echo "  * @brief c++ comment ...\n\t";
		echo "  * @brief place future addtions here ...\n\t  *\n";
	?>
	*/

private:
    T _val;
};

#endif
