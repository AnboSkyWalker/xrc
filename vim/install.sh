#!/bin/bash

function safe_rm()
{
	local file_type="$1"
	local src="$2"
	[ ${file_type} "${src}" ] && rm -rf "${src}"
}

function install()
{
	local file_type="$1"
	local src_file="$2"
	local dst_file="$3"
	[ ${file_type} "${dst_file}" ] && rm -rf "${dst_file}"
	[ -L "${file_type}" ] && unlink "${file_type}"
	[ ! -L "${dst_file}" ] && ln -s "${src_file}" "${dst_file}"
}

function main()
{
  if [ ! -f ~/.vim_runtime/install_awesome_vimrc.sh ]; then
  	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
  	sh ~/.vim_runtime/install_awesome_vimrc.sh
  fi
  
  [ ! -d ~/.vim/ ] && mkdir ~/.vim
  install "-d" $(pwd)/templates ~/.vim/templates
  install "-f" $(pwd)/vimrc ~/.vimrc
	# conflict with vim-go
	safe_rm -f ~/.vim/bundle/vim-template/templates/\=template\=.go
}

main "$@"
