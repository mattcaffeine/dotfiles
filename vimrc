" pathogen
filetype off

execute pathogen#infect()
call pathogen#helptags()

" colors!
colorscheme dracula

syntax enable       " syntax highlighing
filetype plugin indent on " python-mode 

set tabstop=2       " numbers of visual spaces per tab character
set softtabstop=2   " numbers of spaces in tab character
set expandtab       " expandtab on
set smarttab        " smarttab on
set number          " show line numbers
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when needed
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " hightlight search matches

" turn off search highlight
noremap <leader><space> :nohlsearch<CR>

" folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested fold max

" space opens/closes folds
noremap <space> za
set foldmethod=indent   " fold based on indent level

" movement - visual lines vs physical lines
nnoremap j gj
nnoremap k gk

"set nocompatible    " use vim defaults
set ls=2            " allways show status line
set shiftwidth=2    " numbers of spaces to (auto)indent
set smartindent     " smart indent on
set autoindent      " auto indent on

set ruler           " show the cursor position all the time
set ignorecase      " ignore case when searching
set title           " show title in console title bar

"diable arrow keys
:noremap <Up> <nop>
:noremap <Down> <nop>
:noremap <Right> <nop>
:noremap <Left> <nop>

set sm             " show matching braces
set nowrap         " don't wrap lines

set background=dark

" git-gutter
let g:gitgitter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1


"nerdTree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" pymode
map <C-l> :PymodeLintAuto<CR>
