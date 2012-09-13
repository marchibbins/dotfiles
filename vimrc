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
Bundle 'kien/ctrlp.vim'
Bundle "myusuf3/numbers.vim"
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nanotech/jellybeans.vim'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'tComment'

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

" ------------------------------------------
" Movement, nabbed from @krak3n
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

set encoding=utf-8
set t_Co=256

if exists('+colorcolumn')
    set colorcolumn=80 " Color the 80th column differently
endif

" ------------------------------------------
" Bundle settings
" ------------------------------------------

" Jellybeans
colorscheme jellybeans

" NERDTree
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.o', '\.so', '\.swo$', '\.swp$', '\.pyc', '\.git', '\.svn', '\.zip']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Numbers
nnoremap <F3> :NumbersToggle<cr>

" Powerline
let g:Powerline_colorscheme = 'skwp'

" CtrlP
nmap <leader>p :CtrlP .<cr>
