"----------------
" misc
"----------------
"don't try to be compatible with vi
if !has('nvim')
	set nocompatible
endif

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
if !has('nvim')
	set ssop-=options
endif

"instead of raising an error ask for confirmation
set confirm

"allow buffer change with unsaved files
set hidden

"use utf-8 as standard
if !has('nvim')
	set encoding=utf-8
endif

"backspace over indentation, end of line and sth else
if !has('nvim')
	set backspace=indent,eol,start
endif

"filetype specific files
filetype plugin on

"easier []
nnoremap ü [
nnoremap + ]

"smart formatting (comments and tw)
if !has('nvim')
	set formatoptions=tcqj
endif

"filetype for bash vi mode vim
autocmd BufRead,BufNewFile bash-fc-* set filetype=sh

"filetype for msmtprc
autocmd BufRead,BufNewFile .msmtprc set filetype=msmtp

"recognise .md as markdown
au BufRead,BufNewFile *.md set filetype=markdown

"all swp files in .vim/swp
if !has('nvim')
	set directory=~/.vim/swp/
endif

"persistent undo
set undodir=~/.vim/undo//
set undofile

"nicer tabcompletion in command mode
set wildmode=list:longest
set wildmenu

"automatically yank to selection clipboard
set clipboard+=unnamed

"external grep command
set grepprg=grep\ -nH

"look for ctags file
set tags=./tags;$HOME

"run goimports on save
let g:go_fmt_command = "goimports"

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
if !has('nvim')
	set smarttab
endif


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
if !has('nvim')
	set laststatus=2
endif
set statusline=#%02.2n\ %M[%f]%M%<\ %{HasPaste()}%y%r%=%lx%c%V\ %p%%

"show invisibles
set list listchars=tab:›\ 

"show wrapped lines in number column
set showbreak=\ \ \ +
set cpoptions+=n

"set by default in nvim
set nohlsearch



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

"show snippets with ctrl-g
let g:UltiSnipsListSnippets="<c-g>"
nnoremap <c-g> :call Page(":call UltiSnips#ListSnippets()")<CR>

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

"jump to mark
nnoremap ä `

"window movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" Leader bindings
"toggle pastemode
if !has('nvim')
	map <leader>p :set invpaste<CR>
endif

"toggle numbers
map <leader>n :set <c-r>=&rnu?"":"r"<CR>nu<CR>

"follow tag
map <leader>t <c-]>

"gofmt
autocmd FileType go map <leader>f :GoFmt<CR>

"clang format
autocmd FileType c vmap <leader>f :call ClangFmt()<CR>
autocmd FileType c nmap <leader>f :%call ClangFmt()<CR>

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

"open command messages in scratch window
function! Page(cmd)
	redir @z
	silent execute a:cmd
	redir END
	below new
	put z
	setlocal buftype=nofile
	setlocal bufhidden=wipe
	setlocal noswapfile
	setlocal nobuflisted
	normal gg
endfunction

function! ClangFmt()
	pyf /usr/share/clang/clang-format.py
endfunction
