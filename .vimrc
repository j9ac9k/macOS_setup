source ~/Library/Python/3.6/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
syntax on
filetype indent plugin on
colorscheme material-theme

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
      colorscheme material-theme
   endif
endif
