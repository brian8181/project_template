#// License:    None
#// File Name:  ./Makefile
#// Build Date: Tue Nov 14 04:08:48 PM CST 2023
#// Version:    0.0.1

all: reinstall

reinstall: uninstall
	./install.sh

install: uninstall
	./install.sh

uninstall:
	./uninstall.sh