.PHONY: stow dwm

stow:
	echo 'coming soon...'

dwm:
	sudo stow -t /usr/share/xsessions dwm
	sudo make -C ~/.local/src/dwm clean install
