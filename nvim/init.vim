"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"                   ███╗ ██╗██╗   ██╗██╗███╗   ███╗
"                   ████╗██║██║   ██║██║████╗ ████║
"                   ██╔████║██║   ██║██║██╔████╔██║
"                   ██║╚███║╚██╗ ██╔╝██║██║╚██╔╝██║
"                   ██║ ╚██║ ╚████╔╝ ██║██║ ╚═╝ ██║
"                   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  

:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2


call plug#begin()

Plug 'https://github.com/dense-analysis/ale'						" ALE
Plug 'http://github.com/tpope/vim-surround'							" Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree'						" NerdTree
Plug 'https://github.com/tpope/vim-commentary'					" For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'				" Status bar
Plug 'https://github.com/ap/vim-css-color'							" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons'				" Developer Icons
Plug 'https://github.com/preservim/tagbar'							" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors
Plug 'https://github.com/ryanoasis/vim-devicons'				" vim-devicoms
Plug 'https://github.com/neoclide/coc.nvim/'						" coc.vim

" Rust stuff:
" https://blog.logrocket.com/configuring-vim-rust-development/#coc-rust-analyzer
Plug 'https://github.com/rust-lang/rust-analyzer'				"	rust-analyzer
Plug 'https://github.com/rust-lang/rust.vim'						"	rust.vim
Plug 'https://github.com/fannheyward/coc-rust-analyzer'	" coc-rust-analyzer

set encoding=UTF-8

call plug#end()


nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ALE config

let g:ale_linters = {'rust': ['analyzer']}


