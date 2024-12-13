#ifndef _abc_HPP
#define _abc_HPP

// constants

// Options Flags
unsigned char DEFAULTS = 0;
unsigned char option_flags = 0; 


#include <string>
#include <getopt.h>
#include "bash_color.h"

// functions
void print_help();
int parse_options(int argc, char* argv[]);


#endif

