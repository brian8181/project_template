<?php
	/*
    *  @brief create skeleton
	*  @file app_cpp.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
    $NAME=$argv[1];
    $DATE=$argv[2];
	$VERSION="version 0.0.1";
    //$INFO="main"

    include "cstyle_file_header.php"
    ?>

#include <iostream>
#include <string>
#include <getopt.h>
#include "bash_color.h"
#include <?php echo "$NAME.hpp" ?>

using namespace std;

void print_version()
{
	cout << VERSION_STRING << endl;
}

void print_help()
{
	cout << "Usage: "
		 << FMT_BOLD      << "${APP_NAME}" << FMT_RESET << " "
		 << FMT_UNDERLINE << "[OPTION]..."  << FMT_RESET << " "
		 <<  endl;
}

int parse_options(int argc, char* argv[])
{
	cout << FMT_FG_BLUE << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_RED << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_GREEN << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_YELLOW << "Hello World!"  << FMT_RESET << endl;
	return 0;
}
