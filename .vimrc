" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
" Allow left/right movement to go to previous/next lines.
set whichwrap=b,s,h,l,<,>,[,]

" Use indent of previous line for newly created lines.
set autoindent

set backup				" save a backup when overwriting a file		
set backupdir=~/.vim/backup,.,/tmp	" order of directories to attempt saving backup
set backupext=.bak			" change extension from ~ to .bak

set undofile				" undo changes even after closing file
set undodir=~/.vim/undo,.,/tmp		" order of directories to attempt saving undofile

set swapfile				" use swapfile for the buffer
set directory=~/.vim/swap,.,/tmp	" order of directories to attempt saving swapfile

set history=200		" keep 200 lines in each history table (e.g. commands, searches)
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set incsearch		" display the match for a search pattern while still typing it

" Disable Ex mode, and use Q to format text.
map Q gq

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Set timeout for custom mapped key sequences (in ms), length of time Vim
" waits before recognizing start of key sequence as single character.
set timeout
set timeoutlen=250
" Set timeout for key codes, how terminal/Vim represent a key (e.g. F1 is
" ^[[11~). Always a single key press, so code is sent all at once, and we want
" a small ttimeoutlen to prevent hanging on Escape (key code ^[).
set ttimeout		" time out for key codes (special codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Turn on syntax highlighting if colors are available.
if &t_Co > 2 || has("gui_running")
  set hlsearch
  syntax on
  " Highlight strings inside C comments.
  let c_comment_strings=1
endif

" Enable filetype detection (filetype) for syntax highlighting, default
" settings (plugin) and language-dependent indentation (indent). 
filetype plugin indent on

" Only run autocmds if supported.
if has("autocmd")
  " Placing commands in a group allows for easy removal.  
  " e.g. :augroup textFile | au! | augroup END"
  augroup textFile
    " Delete existing commands for group (prevent defining commands twice).
    au!			
    " Set text width to 78 characters (80 - CRLF), if text file detected.
    autocmd FileType text setlocal textwidth=78 
  augroup END
  augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when position is invalid or when inside an event handler.
    autocmd BufReadPost * 
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" | 
    \ endif
  augroup END
endif


" Use jk to exit Insert mode more easily
inoremap jk <Esc>
" Change leader from backslash to comma for easier use.
let mapleader=","
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>
" Quickly remove highlighted matches.
nnoremap <Leader><Space> :nohlsearch<CR>
" Open Vim help to the right.
cabbrev vh vert h
cabbrev vhelp vert help

" matchit package allows for jumping to matching HTML tags, if/endif, etc.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Show 5 lines of context around the cursor.  
set scrolloff=5

" Show @@@ in the last line if it is truncated.
set display=truncate

" See difference between current buffer and file it was loaded from.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
	         \ | wincmd p | diffthis
endif

" Prevent langmap option from applying to characters resulting from a mapping.
if has('langmap') && exists('+langremap')
  set nolangremap
endif

" Split new windows to the right.
set splitright

" Make list command look better.
set listchars=tab:>-,trail:-

" Include dashes in keywords so hyphenated words are recognized as one word.
set iskeyword+=-


