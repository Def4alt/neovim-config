set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()

set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

let g:onedark_termcolors = 256 

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <C-f> :Files<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy :call CocActionAsync('doHover')<CR> 
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

map <C-o> :NERDTreeToggle<CR>

colorscheme codedark 
syntax on

let g:airline_theme = 'codedark'

set encoding=utf-8
set number

