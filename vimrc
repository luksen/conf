"----------------
" misc
"----------------
"don't try to be compatible with vi
set nocompatible

"plugins in .vim/bundle/<plugin>
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"avoid double autocmds
autocmd!

"timeout escape sequences in insert mode sooner (:h esckeys)
set timeout timeoutlen=1000 ttimeoutlen=100

"leader key
let mapleader = "ö"

"scroll 5 lines ahead
set scrolloff=5

"remember cursor column over jumps
set nostartofline

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

"easier []
nnoremap ü [
nnoremap + ]

"easy comment line joining
set formatoptions+=j

"filetype for bash vi mode vim
autocmd BufRead,BufNewFile bash-fc-* set filetype=sh

"filetype for msmtprc
autocmd BufRead,BufNewFile .msmtprc set filetype=msmtp

"recognise .md as markdown
au BufRead,BufNewFile *.md set filetype=markdown

"all swp files in .vim/swp
set directory=~/.vim/swp/

"persistent undo
set undodir=~/.vim/undo//
set undofile


"----------------
" indentation
"----------------

"tabstop every 8 chars
set tabstop=8

"tabs to spaces in python
autocmd FileType python set expandtab

"but still backspace them like tabs
autocmd FileType python set softtabstop=4

"intendation with << and >>
set shiftwidth=8

"<> goes to next full tabstop instead 8 forward
set shiftround

"try to guess better indentation from code
set nosmartindent
filetype indent on

"backspace deletes tab even if expanded
set smarttab


"----------------
" ui
"----------------

"show textwidth
set colorcolumn=80

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

"load additional syntax highlighting
autocmd BufRead ~/notes/* source ~/notes/notes.vim

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

"delete around block including header
map <leader>d daBdd

"small coding helpers
inoremap <F5> <Esc>A {<Return>}<Esc>O
nnoremap <F5> A {<Return>}<Esc>O

"buffer switch
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprevious<CR>

"traverse jump list (other direction ^o)
nnoremap <C-N> <C-I>

"window movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Leader bindings
"toggle pastemode
map <leader>p :set invpaste<CR>

"toggle numbers
map <leader>n :set <c-r>=&rnu?"":"r"<CR>nu<CR>

"follow tag
map <leader>t <c-]>

"gofmt
autocmd FileType go map <leader>f :w<CR>:!gofmt -w %<CR>:e<CR>

"pdflatex
autocmd FileType tex map <leader>l :w<CR>:!pdflatex %<CR><CR>

"cscope
map <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
map <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
map <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
map <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
map <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
map <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
map <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
map <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

"buffer finding/switching
nnoremap <leader>b :ls<CR>:buffer 


"---------------
" functions
"---------------

"return a string that shows whether pastemode is enabled
function! HasPaste()
	if &paste
		return '[P]'
	en
	return ''
endfunction
