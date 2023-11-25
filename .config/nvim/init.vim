set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let mapleader = " "
" note: keep remaps no more than 3 keys
" note: even if removed, remapped commands last for the life of the vim
"   session
" note: vim allows about 1sec before executing a command, just in case it's a
" prefix of a remap. This should be circumvented by using a key that is rare or special
" for command mode as <leader>, e.g. space (we should be using l to progress the cursor)
" custom remap example: <leader>pv
" modes: n, v, i, c, t, etc.
" nore: no recursive execution
" map <leader> i.e. space pv to perform :Vex
" :Vex does a vertical exploratory split
nnoremap <leader>pv :Vex<CR>
" shoutout aka source init.vim
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
"fuzzy-find git repo files in current directory 
nnoremap <C-p> :GFiles<CR> 
"fuzzy-find files in current directory
nnoremap <leader>pf :Files<CR> 

