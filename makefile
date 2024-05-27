# License:    None
# File Name:  ./makefile
# Build Date: Sun May 26 10:57:08 PM CDT 2024
# Version:    0.1.0

all: reinstall

reinstall: uninstall
	./install.sh

install: uninstall
	./install.sh

uninstall:
	./uninstall.sh