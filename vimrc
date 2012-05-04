if has ('gui_running')
        set guioptions-=T
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L        
        set guifont=Monaco:h11
        set autochdir
endif

set nocompatible " Get rid of vi compatibility mode
set encoding=utf-8 " Sets default encoding
syntax enable " Automatic syntax hilightings
set laststatus=2

" Map normal mode space to fold/unfold code
nnoremap <space> za

""""""""""""""""
" Line numbers "
""""""""""""""""
set number " Enable line number column
set numberwidth=4 " Set the column width
        autocmd BufEnter * set relativenumber " Sets relative line numbering on every buffer

"""""""""""
" Tabbing "
"""""""""""

" Python Settings @TODO - Need control statements to handle multiple filetypes
set tabstop=4 " Tab moves 4 spaces
set shiftwidth=4 " Autoindent moves 4 spaces
set softtabstop=4 " Force insert mode tab to 4 spaces
set expandtab " Tabs are spaces
imap <S-Tab> <C-o><<
" HTML Settings
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2


" Auto-indents when possible
set autoindent
set smartindent

" Search
set incsearch
set hlsearch

""""""""""""""""""""""""""""""""""
" Movement/deletion key bindings "
""""""""""""""""""""""""""""""""""
" Map ; to :
nnoremap ; :
" Map -/_ to move line up and down
:map - ddp
:map _ ddkp

" Map jj to escape insert mode
inoremap jj <ESC> 
