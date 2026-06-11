				" Use the Solarized Dark theme

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change maplead let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

call plug#begin()
	" Themes
	Plug 'arcticicestudio/nord-vim'

	" Plugins
	Plug 'preservim/NERDTree'
	let NERDTreeShowHidden=1
	Plug 'Xuyuanp/nerdtree-git-plugin'
	let g:NERDTreeGitStatusConcealBrackets = 1
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

	Plug 'tpope/vim-fugitive'

	Plug 'airblade/vim-gitgutter'
  let g:gitgutter_highlight_lines = 1
  let g:gitgutter_preview_win_floating = 1

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled = 1

	Plug 'ryanoasis/vim-devicons'
	let g:airline_powerline_fonts = 1
  let g:webdevicons_enable=1
  let g:webdevicons_enable_nerdtree=1

	Plug 'preservim/nerdcommenter'
  let g:NERDSpaceDelims = 1
  
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Let cursor mode change based on mode
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"

colorscheme nord

map <F1> :NERDTreeFocus<CR>
map <C-.> :NERDTreeFind<CR>

map <C-_> <Leader>c<Space>
map <C-UP> 5k
map <C-DOWN> 5j
map <C-d>	YP
nmap <ENTER> a
nmap <TAB> <C-w>w

" Tabbing
map <S-C-LEFT> :tabp<CR>
map <S-C-RIGHT> :tabn<CR>
map <S-C-t> :tabnew<CR>
map <S-C-q> :tabclose<CR>

map <C-o> :Files<CR>
map <C-p> :GFiles<CR>
map <C-f> /
map <S-f> :Ag<CR>