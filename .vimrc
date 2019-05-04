" See in-depth set-up guide here:
" https://github.com/jez/vim-as-an-ide/commit/0673f0c
" and adapt from the dotfile found here:
" https://github.com/jez/dotfiles/blob/cc8fe3e26fa112f215c255f369cf462f606bbbf5/vimrc

" ----- General Settings  -----------------------------------------------------
" Use Vim settings. Mmust be first, because it changes other options.
set nocompatible

set autoread          " autoread file when edited outside of vim
set encoding=utf8
set history=100       " lines of command history to remember
set wildmenu          " enable wildmenu visual autocomplete
set magic             " magic for regex
set showmatch         " show matching delimiter

" ignore case in search unless uppercase is specifically used
set ignorecase
set smartcase

" allow backspacing over everything in insert mode, and wrap cursor movement
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=3        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeoutlen=100     " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" tab settings
set expandtab          " expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
set smarttab           " smart tabbing + indentation
set autoindent
set smartindent

" Configure code folding
set foldenable
set foldlevelstart=10 " how many levels to show by default
set foldnestmax=10    " maximum levels to fold
set foldmethod=indent " fold by indentation

" ----- Backup + Undo Settings ------------------------------------------------
" Turn on creation of backup and undo files
set backup
set undofile

" Hide backup, swap, and undo files instead of saving in same directory
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set undodir=~/.vim/tmp,.

" ----- Convenience commands and cabbrev's ------------------------------------

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Use :C to clear hlsearch
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %

" open help in a new tab
cabbrev help tab help

" ----- Custom Keybindings ----------------------------------------------------

" Easier access to leader + escape keys
let mapleader = ","
inoremap jk <ESC> 

" Turn off highlighting more easily
nnoremap <leader><space> :nohlsearch<Return>

" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" ----- Terminal-as-GUI settings ----------------------------------------------
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Maximize window if opening in gvim
" Also set font to Iosevka
if has ("gui_running")
    set lines=999
    set columns=999
    set guifont=Iosevka\ Term\ SS09\ 12
endif

" ----- Not-quite-general-but-don't-belong-anywhere-else Settings -------------

augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!

  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END

" ----- Filetype Settings -----------------------------------------------------

" Enable file type detection.
filetype plugin indent on

augroup myFiletypes
  au!

  " Patch filetypes for common extensions

  " SML signature files
  au BufRead,BufNewFile *.sig setlocal filetype=sml
  " Markdown files
  au BufRead,BufNewFile *.md setlocal filetype=markdown
  " LaTeX class files
  au BufRead,BufNewFile *.cls setlocal filetype=tex
  " Amethyst config file
  au BufRead,BufNewFile .amethyst setlocal filetype=json

  " Turn on spell checking and 80-char lines by default for these filetypes
  au FileType markdown,tex setlocal spell
  au FileType markdown,tex setlocal tw=80

augroup END


" ----- Vundle Plugins Begin --------------------------------------------------
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Aesthetics
Plugin 'altercation/vim-colors-solarized'  " solarized colorscheme
Plugin 'vim-airline/vim-airline'           " fancy statusline
Plugin 'vim-airline/vim-airline-themes'    " solarized theme for statusline

" Programming Aids
Plugin 'scrooloose/nerdtree'      " project tree tab
Plugin 'jistr/vim-nerdtree-tabs'  
Plugin 'vim-syntastic/syntastic'  " syntax checking
Plugin 'xolox/vim-misc'	          " tags in vim
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'       " Ctrl+P fuzzy find files
Plugin 'vim-scripts/a.vim'        " open headers with :AT
Plugin 'airblade/vim-gitgutter'   " integrate Git with Vim
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'	  " insert matching delimiters

" Misc
Plugin 'jez/vim-superman'         " view man pages with Vim

" Syntax Plugins (add any that don't have native support)

" Extras to Consider?
"  " tmux compatibility
"  Plugin 'christoomey/vim-tmux-navigator'
"  " Make tmux look like vim-airline (read README for extra instructions)
"  Plugin 'edkolev/tmuxline.vim'
"  " Highlight and strip trailing whitespace
"  Plugin 'ntpeters/vim-better-whitespace'
"  " Easily surround chunks of text
"  Plugin 'tpope/vim-surround'
"  " Align CSV files at commas, align Markdown tables, and more
"  Plugin 'godlygeek/tabular'
"  " Automaticall insert the closing HTML tag
"  Plugin 'HTML-AutoCloseTag'

call vundle#end()

filetype plugin indent on
" ----- Vundle Plugins End ----------------------------------------------------

" ----- bling/vim-airline settings -----
" Fancy arrow symbols, requires a patched font
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Always show statusbar
set laststatus=2
" Slightly modify the theme colors
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'solarized' && g:solarized_termcolors == 16
    " normal mode background: s:base03
    let a:palette.normal.airline_a[2] = 8
    " normal mode foreground: s:green
    let a:palette.normal.airline_a[3] = 2

    " line no. background: s:base03
    let a:palette.normal.airline_z[2] = 8
    " line no. foreground: s:green
    let a:palette.normal.airline_z[3] = 2
  endif
endfunction

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- xolox/vim-easytags settings -----
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- altercation/vim-colors-solarized settings -----
set background=dark
colorscheme solarized

" Remove the underline Solarized places under Folded previews
hi! Folded cterm=NONE term=NONE

" ----- airblade/vim-gitgutter settings -----
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" Don't open on start-up
let g:nerdtree_tabs_open_on_gui_startup = 0  
let g:nerdtree_tabs_open_on_console_startup = 0

" ----- Builtin Vim plugins -----
" When viewing directories, show nested tree mode
let g:netrw_liststyle=3
" Don't create .netrwhist files
let g:netrw_dirhistmax = 0
