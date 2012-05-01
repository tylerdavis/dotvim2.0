" Display a friendly ASCII cat
echom "(>^.^<)"

" Map normal mode space to fold/unfold code
nnoremap <space> za

""""""""""""""""
" Line numbers "
""""""""""""""""
set number " Enable line number column
set numberwidth=4 " Set the column width
set relativenumber " Set relative line numbers
setglobal relativenumber " Set relative line numbers (globaly)


""""""""""""""""""""""""""""""""""
" Movement/deletion key bindings "
""""""""""""""""""""""""""""""""""
" Map -/_ to move line up and down
:map - ddp
:map _ ddkp
