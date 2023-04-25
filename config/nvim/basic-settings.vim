"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"
"															Basic Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

" Disable compatibility with vi which can cause unexpected issues.
:set nocompatible
" Enable plugins and load plugin for the detected file type.
:filetype plugin on
" Enable type file detection. Vim will be able to try to detect the type of file is use.
:filetype on
" Turn syntax highlighting on.
:syntax on

" Add numbers to the file.
:set number
:set relativenumber
:set autoindent
" Highlight cursor line underneath the cursor horizontally.
:set cursorline
" Highlight cursor line underneath the cursor vertically.
:set cursorcolumn

" Use space characters instead of tabs.
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2

" While searching though a file incrementally highlight matching characters as you type.
:set incsearch
" Use highlighting when doing a search.
:set hlsearch
:set foldmethod=indent
:set encoding=UTF-8

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
:set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

