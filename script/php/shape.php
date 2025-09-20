/**
 * @file    shape.hpp
 * @version version 0.0.1
 * @date    Fri, Sep 19, 2025  8:09:08 PM
 * @info    app info
 */

#ifndef _shape_HPP_
#define _shape_HPP_

/**
  * @brief class shape
  */
class shape{
public:
	shape();
	shape( const shape& src );
	bool operator<( const shape& that );
	virtual ~shape();

	/**
	  * @brief 
	  * @brief c++ comment ...
	  * @brief place future addtions here ...
	  *
	  */

private:

	//<?php echo "\e[2K$argv[1]\n"; ?>
};

#endif
