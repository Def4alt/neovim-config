set nocompatible
filetype off

if has('win32')
	set shell=cmd.exe
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator', {'branch': 'stable'}

call vundle#end()
filetype plugin indent on

set encoding=utf-8
set number
