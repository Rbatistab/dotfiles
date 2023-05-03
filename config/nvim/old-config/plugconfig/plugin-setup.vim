"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"
"															Plugin setup
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  


call plug#begin()

Plug 'https://github.com/dense-analysis/ale'						" ALE
Plug 'https://github.com/tpope/vim-surround'						" Surrounding ysw)
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
Plug 'https://github.com/iamcco/markdown-preview.nvim'	" markdown-preview.nvim

" Rust stuff:
" https://blog.logrocket.com/configuring-vim-rust-development/#coc-rust-analyzer
Plug 'https://github.com/rust-lang/rust-analyzer'				"	rust-analyzer
Plug 'https://github.com/rust-lang/rust.vim'						"	rust.vim
Plug 'https://github.com/fannheyward/coc-rust-analyzer'	" coc-rust-analyzer


call plug#end()

