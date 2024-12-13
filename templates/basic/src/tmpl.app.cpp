// File Name:  @@FILE_NAME@@
// Build Date: @@BUILD_DATE@@
// Version:    @@VERSION@@

#include <iostream>
#include <string>
#include <getopt.h>
#include "bash_color.h"
#include "@@APP_NAME@@.hpp"

using namespace std;

const string VERSION_STRING = "0.0.1";

void print_version()
{
	cout << VERSION_STRING << endl;
}

void print_help()
{
	cout << "Usage: "
		 << FMT_BOLD      << "@@APP_NAME@@" << FMT_RESET << " "
		 << FMT_UNDERLINE << "[OPTION]..."  << FMT_RESET << " "
		 <<  endl;
}

int parse_options(int argc, char* argv[])
{
	for(int i = 0; i < argc; ++i)
	{
		cout << "argv[" << i << "]=" << argv[i] << endl;
	}

	cout << FMT_FG_BLUE << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_RED << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_GREEN << "Hello World!"  << FMT_RESET << endl;
	cout << FMT_FG_YELLOW << "Hello World!"  << FMT_RESET << endl;
	return 0;
}
