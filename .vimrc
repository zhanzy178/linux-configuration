" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" 设置粘贴功能
vmap <C-x> :!pbcopy<CR>   
vmap <C-c> :w !pbcopy<CR><CR>

"   (表示每一级缩进的长度)
set shiftwidth=4
" （表示在编辑模式的时候按退格键的时候退回缩进的长度）
set softtabstop=4 
" （显示行号）
set nu
" （自动缩进）
set autoindent

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
