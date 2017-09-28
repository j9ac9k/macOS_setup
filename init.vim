let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin()
Plug 'cjrh/vim-conda'
Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer' }
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

filetype plugin indent on    " required
syntax on

" Enable folding
" set foldmethod=indent
" set foldlevel=99


"  ---
"  Watching for vimrc updates
"  ---
" augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END


" ---
" Key Remapping
" ---

" Enable folding with the spacebar
nnoremap <space> za
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable Line Numbers
" set number

" Colorscheme settings
let g:enable_bold_font = 1
set background=dark
set termencoding=utf-8
set termguicolors
colorscheme hybrid_material

" ---
"  Airline
" ---

let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
" let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1


let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" pep8 indentation
au BufRead *.py
   \ set tabstop=4
   \ set softtabstop=4
   \ set shiftwidth=4
   \ set textwidth=79
   \ set expandtab
   \ set autoindent
   \ set fileformat=unix

" Flagging unnecessary whitespace
autocmd BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"YCM configs
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set laststatus=2
set encoding=utf-8
