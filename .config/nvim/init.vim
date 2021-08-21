set tabstop=4
set softtabstop=4
set shiftwidth=4
set ts=4
set sw=4
set expandtab

" Highlight current line
set cursorline

set autoindent

" Show line's number
set number

call plug#begin('~/.local/share/nvim-plugin/')

Plug 'arcticicestudio/nord-vim'

call plug#end()

syntax on

colorscheme nord
