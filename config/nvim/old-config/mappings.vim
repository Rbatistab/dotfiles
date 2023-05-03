"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"
"																	Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

:let mapleader = "\\"

nnoremap <leader>\ :nohlsearch<CR>

" " Type jj to exit insert mode quickly.
inoremap jj <esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" " NERDTree specific mappings.
" " Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" " Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

