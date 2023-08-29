all: reinstall

reinstall: uninstall
	./install.sh

install:
	./install.sh

uninstall:
	./uninstall.sh