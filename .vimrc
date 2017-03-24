let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin()
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'rizzatti/dash.vim'
Plug 'cjrh/vim-conda'
call plug#end()


let g:jedi#force_py_version = 2
let g:UltisnipsUsePythonVersion = 2

execute pathogen#infect()
syntax enable

" Theme/Colorscheme
set term=xterm-256color
set termencoding=utf-8
set termguicolors
set background=dark
colorscheme material-theme

set softtabstop=4


" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


" pep8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" Powerline Plugin
source ~/bin/powerline/bindings/vim/plugin/powerline.vim
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set t_Co=256

set laststatus=2
 
set encoding=utf-8

