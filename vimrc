" Vimrc: Marc Hibbins (@marchibbins)

set nocompatible " be iMproved

"===============================================================================
" Plugins
"===============================================================================

call plug#begin()

" Colour
Plug 'chriskempson/base16-vim'

" Movement
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'scrooloose/nerdcommenter'

" Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Enable filetype plugins
filetype plugin indent on

syntax on

"===============================================================================
" General settings
"===============================================================================

try
  lang en_gb
catch
endtry

" Reload vimrc after writing
autocmd! BufWritePost .vimrc source ~/.vimrc

" Explicitly set encoding to utf-8
set encoding=utf-8

" 256bit terminal
set t_Co=256

" Colour
let base16colorspace=256
set background=dark
colorscheme base16-default

" Turn on line number
set number
set relativenumber

" Turn on ruler
set ruler

" Always splits to the right and below
set splitright
set splitbelow

" Give one virtual space at end of line
set virtualedit=onemore

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=1

" Min width of the number column to the left
set numberwidth=4

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

" Wild menu
set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*~,*.o,*.obj,.git
set wildignore+=*.so,*.swo,*.swp,*.pyc,__pycache__
set wildignore+=*.db,*.sqlite,*/logs/*,*/tmp/*,*.zip

" Set backspace config
set backspace=eol,start,indent

" Highlight search results
set hlsearch

" Case insensitive search
set ignorecase
set smartcase

" Set sensible heights for splits
set winheight=50

" Make search act like search in modern browsers
set incsearch

" Show matching brackets
set showmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Make the command area two lines high
set cmdheight=2

" Column width indicator
set colorcolumn=80

" Tab settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" Text display settings
set linebreak
set textwidth=120
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Kill arrows
noremap  <up> ""
noremap! <up> <esc>
noremap  <down> ""
noremap! <down> <esc>
noremap  <left> ""
noremap! <left> <esc>
noremap  <right> ""
noremap! <right> <esc>

"==============================================================================
" Leader mappings
"==============================================================================

" Map leader and localleader key to comma
let mapleader=","
let g:mapleader=","

" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Tab mappings
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>

" Quick vimrc editing
nnoremap <leader>e :e! ~/.vimrc<cr>

" <leader>f: Autoformat
nnoremap <silent> <leader>f :Autoformat<cr>

" Disable highlight
nmap <silent> <leader>. :noh<cr>

"===============================================================================
" Command-line key mappings
"===============================================================================

cnoremap <c-j> <down>
cnoremap <c-k> <up>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-[ae]: Bash like start/eol
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

"===============================================================================
" Normal mode key mappings
"===============================================================================

" d: Delete into the blackhole
nnoremap d "_d

" dd: Yank single line
nnoremap dd dd

" c: Change into the blackhole
nnoremap c "_c

"===============================================================================
"" Visual node key mappings
"===============================================================================

" d: Delete into the blackhole
xnoremap d "_d

" [<>]: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" .: repeats the last command on every line
xnoremap . :normal.<cr>

"===============================================================================
" Normal mode Shift key mappings
"===============================================================================

" Q: Closes the window
nnoremap Q :q<cr>

" Y: Yank to end of line
nnoremap Y y$

" H: Go to beginning of line
noremap H ^

" L: Go to end of line
noremap L g_

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" _: Quick horizontal split
nnoremap _ :sp<cr>

" |: Quick vertical split
nnoremap <bar> :vsp<cr>

"===============================================================================
" Normal mode Ctrl key mappings
"===============================================================================

" Ctrl-[hjkl]: Window movement
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

"===============================================================================
" Insert mode Ctrl key mappings
"===============================================================================

" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>

" Ctrl-k: Delete til end of line, create undo point
inoremap <c-k> <c-g>u<c-o>D

"===============================================================================
" Normal mode Alt Key Mappings
"===============================================================================

" Alt-[hjkl]: Move lines
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==

"===============================================================================
" Insert mode Alt Key Mappings
"===============================================================================

inoremap <a-j> <esc>:m .+1<cr>==gi
inoremap <a-k> <esc>:m .-2<cr>==gi

"===============================================================================
" Visual mode Alt Key Mappings
"===============================================================================

vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

"===============================================================================
" Plugin settings
"===============================================================================

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_c = airline#section#create_left(['%{getcwd()}', 'file'])
let g:airline_theme = 'base16'

" NERDTree
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.so', '\.swo$', '\.swp$', '\.pyc', '__pycache__']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

"===============================================================================
" Spelling
"===============================================================================

if !has("gui_running")
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=red
    hi clear SpellCap
    hi SpellCap cterm=underline ctermfg=blue
    hi clear SpellLocal
    hi SpellLocal cterm=underline ctermfg=blue
    hi clear SpellRare
    hi SpellRare cterm=underline ctermfg=blue
endif

" Toggle spell checking
nnoremap <F5> :setlocal spell! spelllang=en_gb<cr>
