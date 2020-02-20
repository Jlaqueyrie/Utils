set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
syntax on
filetype indent plugin on
set wrap

" set the runtime path to include Vundle and initialize
set rtp+=%USERPROFILE%/.vim/bundle/Vundle.vim/
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

call vundle#begin()
"-----------Plugin-----------------"

" let Vundle manage Vundle, required
Plugin 'davidhalter/jedi-vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'klen/python-mode'
Plugin 'brookhong/dbgpavim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine' 
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"----------------General setting------------------"
"-----------------Switch mode --------------------"
inoremap jj <Esc>   """ jj key is <Esc> setting

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>
"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"split of windows
"
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Fold code
set foldmethod=indent
set foldlevel=99
set number
set backspace=indent,eol,start

"Config highigh syntax for python
"
if has('gui_running')
  set background=dark
  colorscheme solarized8
else
  colorscheme zenburn
endif

syntax enable
set background=dark
colorscheme solarized8

"--------------Python-Mode---------------"
let g:pymode = 1

let g:pymode_run = 1

let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_python = 'python3'
"Ctrl+Shift+d
let g:pymode_run_bind_ = '<leader>r'

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

let g:pymode_rope_completion = 1 
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1

let g:pymode_rope_goto_definition_bind = '<C-c>g'

let g:pymode_rope_organize_imports_bind = '<leader>s'

filetype on
"autocmd FileType python nnoremap <buffer> <F9> :exec ':!C:\Users\jlaqueyr\AppData\Local\Programs\Python\Python37\Scripts\pudb3.exe' shellescape(@%, 1)<cr>
nnoremap <buffer> <F9> :exec ':!C:\Users\jlaqueyr\AppData\Local\Programs\Python\Python37\python.exe' shellescape(@%, 1)<cr>
nnoremap <buffer> <F10> :exec ':!C:\Users\jlaqueyr\AppData\Local\Programs\Python\Python37\python.exe C:\Users\jlaqueyr\AppData\Local\Programs\Python\Python37\Scripts\winpdb.exe' shellescape(@%, 1)<cr>
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 1
"let g:jedi#auto_vim_configuration = 1
"let g:jedi#smart_auto_mappings = 1
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"

"----------Airlines----------"
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:indent_guides_enable_on_vim_startup = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'
"
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
