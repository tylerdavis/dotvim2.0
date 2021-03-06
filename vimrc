set nocompatible " Get rid of vi compatibility mode
filetype off

" Launch Pathogen
call pathogen#infect()
call pathogen#helptags()

colorscheme obsidian2

if has ('gui_running')
        set guioptions-=T
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L        
        set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12
        set autochdir
endif

""""""""""""""""""
" General Config "
""""""""""""""""""
let mapleader = "," " Map leader to ,
set modelines=0
set encoding=utf-8 " Sets default encoding
syntax enable " Automatic syntax hilightings
set laststatus=2 " Always show a status line
set hidden " Prevents buffers from being abandoned when navigated away from
set scrolloff=5 " Minumum 5 lines visible above and below cursor line
set showcmd " Show last command on last line
set ttyfast " Sends more characters to the terminal for better draw
set autowrite " automatically saves before make command is executed
set antialias " enable afont aliasing

" Toggle spell check
nnoremap <leader>s :set spell!<cr>

" set <leader>m to :make
nnoremap <leader>m :make<cr>


""""""""""""""""""""""
" Filetype specifics "
"""""""""""""""""""""" 
au FileType ruby set makeprg=ruby\ %

"""""""""""""""""""
" Code Completion "
"""""""""""""""""""
set wildmenu " Changes the way the autocomplete menu works
set wildmode=list:longest
" CSS Specific
:set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" NodeJS Specific
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict



" Stuff to ingnore
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif

""""""""""""""""
" Code folding "
""""""""""""""""
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set foldlevel=99
" Map visual mode space to create fold
vnoremap <space> zf
" Map normal mode space to fold/unfold code
nnoremap <space> za

""""""""""""""""
" Line numbers "
""""""""""""""""
set rnu " Enable relative line numbering
set numberwidth=2 " Set the column width

"""""""""""""""""""""""
" Buffers and Windows "
"""""""""""""""""""""""
" Split window vertically
nnoremap <leader>w <C-w>v
" Splut window horizontally
nnoremap <leader>W <C-w>s

"""""""""""
" Tabbing "
"""""""""""
" Python Settings @TODO - Need control statements to handle multiple filetypes
set tabstop=2 " Tab moves 4 spaces
set shiftwidth=2 " Autoindent moves 4 spaces
set softtabstop=2 " Force insert mode tab to 4 spaces
set expandtab " Tabs are spaces

" Auto-indents when possible
filetype plugin indent on
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
map - ddp
map _ ddkkp

" Map jj to escape insert mode
imap jj <ESC> 

" Map ctrl + movement to switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Backspaces in insert mode
set backspace=indent,eol,start

" Multi-select
let g:multi_cursor_next_key='<D-d>'

" Insert mode newline before cursor
inoremap <S-D-CR> <Esc>O
" Insert mode newline before cursor
inoremap <D-CR> <Esc>o

""""""""""
" Search "
""""""""""
" Forces python style regex
nnoremap / /\v
vnoremap / /\v
set ignorecase " If search string is all lower case, ignore case
set smartcase " If search string has an uppercase character, be case sensitive
set gdefault " Global substitutions without /g

set incsearch " Search hilighting as you type
set showmatch
set hlsearch

" Clear search with ,<space>
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""
" Syntax Checking "
"""""""""""""""""""
let g:syntastic_python_checker_args='--ignore=E501'

"""""""""""""""""""
" Plugin Specific "
"""""""""""""""""""

" Enable NERDTree focus
nnoremap <leader>n :NERDTreeFocus<cr> 
" Toggle NERDTree with ,n
" nnoremap <leader>N :NERDTreeToggle<cr>
" Ignore filetypes in NERDTree
let NERDTreeIgnore = ['\.pyc$']
" Toggle line comment in normal mode or selection in visual mode
map <d-/> <leader>c<space>
" Toggle Tagbar with ,t
nnoremap <leader>t :TagbarToggle<CR>
" Remap pep8 keybinding
autocmd FileType python map <buffer> <leader>p :call Flake8()<CR>
" Open Errors window with ,s
nnoremap <leader>e :Errors<CR><C-w>j

set rtp+=/Users/tylerdavis/Development/powerline/powerline/bindings/vim
