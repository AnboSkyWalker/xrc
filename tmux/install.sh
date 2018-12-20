#!/bin/bash

if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -f ~/.tmux.conf ]; then
	ln -s $(pwd)/tmux.conf ~/.tmux.conf
fi
