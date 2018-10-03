let g:python_host_prog = '/Users/ogi/.pyenv/versions/2.7.15/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin()
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
Plug 'davidhalter/jedi-vim'
  Plug 'lambdalisue/vim-pyenv'
call plug#end()

" ---------- Misc Settings -------------
filetype plugin indent on    " required

set cursorline

syntax on

" Enable folding
set foldmethod=indent
set foldlevel=99

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Softtabs, 2 spaces
set tabstop=8
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display line numbers on the left
set number
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=100
highlight ColorColumn ctermbg=233


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

" Airline plugin configuration
set laststatus=2                "airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_statusline=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"YCM configs
" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_interpreter_path = '/Users/ogi/.pyenv/versions/miniconda3-latest/envs/main/bin/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" pyenv-jedi Allows changing of jedi versions
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif