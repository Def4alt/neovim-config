set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

set number
set noswapfile
set nobackup
set termguicolors
set scrolloff=4
set title
set mouse=a
set bg=dark
set encoding=utf-8
set updatetime=300
set cmdheight=2

set clipboard=unnamedplus

if has('syntax')
	syntax on
endif

filetype plugin on

let $VIM_AUTOLOAD = stdpath('config') . '/autoload/'
let $VIM_PLUG = $VIM_AUTOLOAD . 'plug.vim'

if ! filereadable(system('echo -n $VIM_PLUG'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $VIM_AUTOLOAD 
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $VIM_PLUG 
	echo "Done!"
else
	let $VIM_CONFIG = stdpath('config') . '/init.vim'

	autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
				\| PlugInstall --sync | source $VIM_CONFIG 
	\| endif

	call plug#begin(stdpath('data') . '/plugged/')

	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tomasiser/vim-code-dark'
	Plug 'vim-airline/vim-airline'
	Plug 'scrooloose/nerdtree'

	call plug#end()

	colorscheme codedark
	let g:airline_theme = 'codedark'
	let g:onedark_termcolors = 256

	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
		\ quit | endif

	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	nnoremap <silent> <C-f> :GitFiles<CR>

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy :call CocActionAsync('doHover')<CR>
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc_references)

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1] =~ '\s'
	endfunction

	inoremap <silent><expr> <Tab>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<Tab>" :
		\ coc#refresh()

	map <C-o> :NERDTreeToggle<CR>
endif
