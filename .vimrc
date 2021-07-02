
    call plug#begin('~/.vim/plugged')
            Plug 'Mcmartelle/vim-monokai-bold'
            Plug 'sickill/vim-monokai'
            Plug 'mhartington/oceanic-next'
    call plug#end()

    "Leader Keybindings:"
    
        let mapleader = " "
        let g:oceanic_next_terminal_bold = 1
        colorscheme OceanicNext
        set termguicolors
        syntax on
        set nu
        set cursorline
        " au TextYankPost * silent! lua require("vim.highlight").on_yank({ higroup = 'IncSearch', timeout = 300 })


    " Open tab
        map <leader>pi :PlugInstall<cr>
        map <leader>pc :PlugClean<cr>
        map <leader>o :so ~/.vimrc<cr>

    " Open tab
        map <leader>t :tabnew<cr>
    " Split screen
        map <leader>s :split<cr>
        map <leader>vs :vsplit<cr>
    " Split screen and resize 55
        nnoremap <leader>ss :wincmd v<bar> :Ex <bar> :vertical resize 55<CR>
    " Saves the file.
        map <leader>w :w<cr>
    " Saves the file with force.
        map <leader>W :w!<cr>
    " Quits vim.
        map <leader>q :q<cr> " Quits vim with force.  map <leader>Q :q!<cr>
    " Autoread.(editor)
        map <leader>a :e<cr>
    " Resize vertical windows
        nnoremap <Leader>+ :vertical resize +5<CR>
        nnoremap <Leader>- :vertical resize -5<CR>
    " ; for :                                                                                                                                                                               
        nnoremap ; :                                                                                                                                                                        
        nnoremap ; :

    " Go to tab by number
        noremap <leader>1 1gt
        noremap <leader>2 2gt
        noremap <leader>3 3gt
        noremap <leader>4 4gt
        noremap <leader>5 5gt
        noremap <leader>6 6gt
        noremap <leader>7 7gt
        noremap <leader>8 8gt
        noremap <leader>9 9gt
        noremap <leader>0 :tablast<cr>

        set nocompatible
    " format
        set autoindent
        set backup
        set nu
        set smartindent
        set showmatch
        set textwidth=80
        set title
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
     " files 
        filetype on
        filetype indent on
        filetype plugin on
     " always show file name
        set modeline
        set ls=2


        " undo
        set undofile
        set undodir=~/.vim/undodir-vim
        set undolevels=1000
        set undoreload=10000
        set noswapfile

