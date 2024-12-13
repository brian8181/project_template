// File Name:  @@FILE_NAME@@
// Build Date: @@BUILD_DATE@@
// Version:    @@VERSION@@

#include <iostream>
#include <cstring>
#include <string>
#include <unistd.h>         /* for STDIN_FILENO */
#include <sys/select.h>     /* for pselect   */
#include <string>
#include <getopt.h>
#include "@@APP_NAME@@.hpp"

int stdin_ready (int filedes)
{
	fd_set set;
	// declare/initialize zero timeout
	struct timespec timeout = { .tv_sec = 0 };
	// initialize the file descriptor set
	FD_ZERO(&set);
	FD_SET(filedes, &set);
	// check stdin_ready is ready on filedes
	return pselect(filedes + 1, &set, NULL, NULL, &timeout, NULL);
}

int main(int argc, char* argv[])
{
	try
	{
		char* pipe_buff[sizeof(char*) * argc+1];
		if(stdin_ready(STDIN_FILENO))
		{
			std::string buffer;
			std::cin >> buffer;
			// add pipe_buff buffer to end of argv
			memcpy(pipe_buff, argv, sizeof(char*) * argc);
			pipe_buff[argc] = &buffer[0];
			++argc;
			return parse_options(argc, pipe_buff);
		}
		return parse_options(argc, argv);
	}
	catch(std::logic_error& ex)
	{
	 	std::cout << ex.what() << std::endl;
	}
}