"" Vimrc: Marc Hibbins (@marchibbins)

set nocompatible " Be iMproved

" ------------------------------------------
" NeoBundle
" ------------------------------------------

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Asynchronous processes in vim
NeoBundle 'Shougo/vimproc', { 'build': {
        \ 'windows': 'make -f make_mingw32.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
        \ } }

" http://editorconfig.org/
NeoBundle 'editorconfig/editorconfig-vim'

" Theme
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" Check for uninstalled bundles
NeoBundleCheck

" ------------------------------------------
" General settings
" ------------------------------------------

" Enable filetype plugins (must turn on after Vundle)
filetype plugin on
filetype indent on

" Set leader (must come before any <leader> mappings)
let mapleader = ","

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Reload vimrc after writing
autocmd! BufWritePost .vimrc source ~/.vimrc

" ------------------------------------------
" User interface
" ------------------------------------------

" Wild menu
set wildmenu
set wildignore+=*~,*.o,*.so,*.swo,*.swp,*.pyc,*/logs/*,*/tmp/*,*.zip

set ruler
set number
set showmatch
set ignorecase
set smartcase      " When searching try to be smart about cases
set hlsearch       " Highlight search results

set cmdheight=2    " Make the command area two lines high
set laststatus=2   " Always show the statusline

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable highlight
map <silent> <leader>. :noh<cr>

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Yank to end of line
noremap Y y$

" ------------------------------------------
" Movement, bits nabbed from @krak3n
" ------------------------------------------

" Easier way to move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Arrow keys do nothing, EVIL arrows
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Move lines, want Ctrl+Shift but only arrow keys left :(
nnoremap <C-Down> :m .+1<cr>==
nnoremap <C-Up> :m .-2<cr>==
inoremap <C-Down> <Esc>:m .+1<cr>==gi
inoremap <C-Up> <Esc>:m .-2<cr>==gi
vnoremap <C-Down> :m '>+1<cr>gv=gv
vnoremap <C-Up> :m '<-2<cr>gv=gv

" ------------------------------------------
" Indentation
" ------------------------------------------

set autoindent
set smartindent

set wrap           " Wrap lines
set expandtab      " Use spaces instead of tabs
set smarttab       " Be smart when using tabs

" Tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

" ------------------------------------------
" Colours
" ------------------------------------------

" Syntax highlighting
syntax enable

" Theme
set background=dark
colorscheme jellybeans

set encoding=utf-8
set t_Co=256

if exists('+colorcolumn')
    set colorcolumn=80 " Color the 80th column differently
endif

