" encoding support
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" cut and copy to mac system clipboard.
vmap <C-x> :!pbcopy<CR>   
vmap <C-c> :w !pbcopy<CR><CR>

" tab width
set shiftwidth=4

" auto indent width
set softtabstop=4 

" show line number
set nu

" auto indent
set autoindent

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Set the width of the tab display, Python is recommended to set to 4
set tabstop=4 

"Then set the following line to automatically expand the tab into a space.
set expandtab

"Smart indentation
set smartindent 

"C language style indentation
set cindent

"Show cursorline
set cursorline
