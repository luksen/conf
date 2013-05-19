"----------------
" misc
"----------------
"don't try to be compatible with vi
set nocompatible

"avoid double autocmds
autocmd!

"timout escape sequences in insert mode sooner (:h esckeys)
set timeout timeoutlen=1000 ttimeoutlen=100

"leader key
let mapleader = "ö"

"scroll 5 lines ahead
set scrolloff=5

"don't save options in sessions
set ssop-=options

"instead of raising an error ask for confirmation
set confirm

"allow buffer change with unsaved files
set hidden

"use utf-8 as standard
set encoding=utf-8

"backspace over indentation, end of line and sth else
set backspace=indent,eol,start

"filetype specific files
filetype plugin on

"80 chars per line
set textwidth=80

"easier []
nnoremap ü [
nnoremap + ]


"----------------
" indentation
"----------------

"tabstop every 4 chars
set tabstop=4

"tabs to spaces in python
autocmd FileType python set expandtab

"but still backspace them like tabs
autocmd FileType python set softtabstop=4

"Intendation with << and >>
set shiftwidth=4

"<> goes to next full tabstop instead 4 forward
set shiftround

"try to guess better indentation from code
set nosmartindent
filetype indent on

"backspace deletes tab
set smarttab


"----------------
" ui
"----------------

"show textwidth
set colorcolumn=+0

"change terminal title
set title

"show partial commands
set showcmd

"show line numbers 
set number

"highlight cursoline
set cursorline

"show current mode
set showmode

"show cursor position
set ruler

"256 colors
set t_Co=256

"use a colortheme for dark backgrounds
set background=dark

"colortheme
colorscheme wombat256mod

"syntax high
syntax on

"statusline
set laststatus=2
set statusline=#%02.2n\ %M[%f]%M%<\ %{HasPaste()}%y%r%=%lx%c%V\ %p%%

"show invisibles
set list listchars=tab:›\ 

"show wrapped lines in number column
set showbreak=\ \ \ +
set cpoptions+=n



"----------------
" folding
"----------------

"create folds according to syntax
set foldmethod=syntax
"use indentation for python files
autocmd FileType python setlocal foldmethod=indent

"only fold two levels
"set foldnestmax=2

"start with folds open
set foldlevelstart=99

"use spacebar for foldtoggling
nnoremap <space> za
nnoremap <leader><space> zA

"prevent foldopening on insert
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


"----------------
" misc key bindings
"----------------


"small coding helpers
inoremap <F5> <Esc>A {<Return>}<Esc>O
nnoremap <F5> A {<Return>}<Esc>O

"buffer switch
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprevious<CR>

"traverse jump list (other direction ^o)
nnoremap <C-N> <C-I>

"window movement
noremap <C-h> :wincmd h<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-l> :wincmd l<CR>

" Leader bindings
" cap word
map <leader>c viw~

"toggle pastemode
map <leader>p :set invpaste<CR>

"toggle numbers
map <leader>n :set <c-r>=&rnu?"":"r"<CR>nu<CR>

"follow tag
map <leader>t <c-]>

"gofmt
autocmd FileType go map <leader>f :w<CR>:!gofmt -w %<CR>:e<CR>


"---------------
" functions
"---------------

"return a string that shows wether pastmode is enabled
function! HasPaste()
    if &paste
        return '[P]'
    en
    return ''
endfunction
