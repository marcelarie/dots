" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = " "

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" No bell
set belloff=all

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

nnoremap ; :
nnoremap : ;

" Formatting
nnoremap <leader>q :q<cr>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
"
" Toggle tabs and EOL
map <leader>l :set list!<CR>


call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color scheme
Plug 'lighthaus-theme/vim-lighthaus'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

call plug#end()

" NerdTree
map <leader><tab> :NERDTreeToggle<cr>

" FZF
map <leader>f :Files<cr>
map <leader>b :Buffers<cr>
nnoremap <leader>rg :Rg<cr>


" Source .vimrc
map <leader>so :source ~/.vimrc<cr>

" Color scheme (terminal)
