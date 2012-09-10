
"" Vimrc: Marc Hibbins (@marchibbins)

set nocompatible " be iMproved
filetype off     " required!

" ------------------------------------------
" Vundle plug-in management
" ------------------------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Plugins
Bundle 'scrooloose/nerdtree'
Bundle "myusuf3/numbers.vim"
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'groenewege/vim-less'

" ------------------------------------------
" General settings
" ------------------------------------------

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins (must turn on after Vundle)
filetype plugin on
filetype indent on

" Set leader (must come before any <leader> mappings)
let mapleader = ","

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" ------------------------------------------
" User interface
" ------------------------------------------

" Wild menu
set wildmenu
set wildignore=*~,*.o,*.pyc

set ruler          " Ruler on
set nu             " Line numbers on
set showmatch      " Show matching brackets
set ignorecase     " Ignore case when searching
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
map <silent> <leader><leader> :noh<cr>

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" ------------------------------------------
" Indentation
" ------------------------------------------

set ai             " Auto indent
set si             " Smart indent
set wrap           " Wrap lines
set expandtab      " Use spaces instead of tabs
set smarttab       " Be smart when using tabs

" Tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" ------------------------------------------
" Colours
" ------------------------------------------

" Syntax highlighting
syntax enable

set encoding=utf-8
set t_Co=256

if exists('+colorcolumn')
    set colorcolumn=80 " Color the 80th column differently
endif

" ------------------------------------------
" Bundle settings
" ------------------------------------------

" Solarized
" set background=dark
" colorscheme solarized

" Jellybeans
colorscheme jellybeans

" NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.o', '\.pyc', '\.swo$', '\.swp$', '\.git', '\.svn']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Numbers
nnoremap <F3> :NumbersToggle<CR>

" Powerline
let g:Powerline_colorscheme = 'skwp'

