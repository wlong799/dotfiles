"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim specific settings (not compatible with vi)
set nocompatible

" Set lines of command history to remember
set history=100

" Enable filetype plugins
filetype plugin on
filetype indent on

" Autoread file when edited outside of vim
set autoread

" Remap mapleader to comma
let mapleader = ","

" Set encoding to utf-8
set encoding=utf8

" Enable mouse in all modes when present
if has('mouse')
  set mouse=a
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable wildmenu visual autocomplete
set wildmenu

" Show command in bottom bar 
set showcmd

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Properly wrap cursor movement and backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case unless uppercase used in search
set ignorecase
set smartcase

" Highlight search results and match search as it is typed
set hlsearch
set incsearch 

" Don't redraw unless necessary (improve performance)
set lazyredraw 

" Set magic for regex
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" Enable syntax highlighting
syntax enable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup, swap, and undo file directories
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set undodir=~/.vim/tmp,.

" Turn on creation of backup and undo files
set backup
set undofile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text and Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace tabs with four spaces
set tabstop=4
set softtabstop=4
set expandtab

" Smart indentation
set shiftwidth=4
set smarttab
set autoindent
set smartindent

" Configure code folding
set foldenable
set foldlevelstart=10 " How many levels to show by default
set foldnestmax=10    " Maximum levels to fold
set foldmethod=indent " Fold by indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier exit from insert mode
inoremap jk <ESC>

" Space key used to search
noremap <space> /
noremap <c-space> ?

" Turn off highlighting more easily
nnoremap <leader><space> :nohlsearch<Return>

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif