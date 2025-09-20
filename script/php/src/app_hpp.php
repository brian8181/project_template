<?php
	/*
    *  @brief create skeleton
	*  @file app_hpp.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION="version 0.0.1";
    //$INFO="main"

    include "cstyle_file_header.php"
    ?>


#ifndef _<?php echo "$NAME" ?>_HPP
#define _<?php echo "$NAME" ?>_HPP

#include <string>

using std::string;

void print_help();
void print_version();
int parse_options(int argc, char* argv[]);

#endif
