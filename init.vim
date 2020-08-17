set nocompatible
filetype off

if has('win32')
	set shell=cmd.exe
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/YouCompleteMe', {'do': './install.py --clangd-completer'}
Plugin 'rdnetto/YCM-Generator', {'branch': 'stable'}

call vundle#end()
filetype plugin indent on

set encoding=utf-8
