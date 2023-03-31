// License: @@LICENSE@@
// Author: @@AUTHOR@@
// File Name: @@FILE_NAME@@
// Build Date: @@BUILD_DATE@@
// Version: @@VERSION@@

#ifndef _STD_HPP
#define _STD_HPP

#include <string>
#include <getopt.h>
#include "bash_color.h"

// functions
void print_help();
void print_match_header(const string& pattern, const string& src, const bool single_flag, const bool pretty_flag);
int parse_options(int argc, char* argv[]);

#endif
