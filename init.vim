let g:python_host_prog = '/Users/ogi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/ogi/.pyenv/versions/neovim3/bin/python'

call plug#begin()
" Documentation
Plug 'rizzatti/dash.vim'

" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ryanoasis/vim-devicons'

" Nerd Tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tmhedberg/SimpylFold'

" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Python AutoComplete and Linting
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py --clang-completer' }

Plug 'davidhalter/jedi-vim'
  Plug 'lambdalisue/vim-pyenv'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" " (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi', { 'for': 'python' }

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
let g:airline#extensions#ale#enabled = 1

"" ale signs for errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

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

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 20

" ALE options
let g:ale_completion_enabled = 0

"" jedi-vim
" let g:jedi#popup_on_dot = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "1"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#smart_auto_mappings = 0

" Since I'm using deoplete-jedi
let g:jedi#completions_enabled = 0

" pyenv-jedi Allows changing of jedi versions
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
    let g:deoplete#sources#jedi#python_path = g:pyenv#python_exec
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif