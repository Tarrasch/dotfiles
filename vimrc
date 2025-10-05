" No vi comptiblilty (I think) /Arash
set nocompatible

" Map leader key
let mapleader = " "

" """""""""""""""""""""" GOOGLE """"""""""""""""""""""""""""
" vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

" Google
if filereadable("/usr/share/vim/google/google.vim")
  source ~/.vim/google.vim
endif


" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"""""""""""""""""""""""" GOOGLE """"""""""""""""""""""""""""

" Turn on line numbering. Turn it off with "set nonu"
set nu

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Higlhight search
set hlsearch

set incsearch     " show search matches as you type

" Wrap text instead of being on one line
set linebreak

" Set dracula theme
syntax enable
set background=dark
colorscheme dracula

" Letting this sit here until I've decided to ditch solarized...
" " Set solarized (from `:help solarized`)
" syntax enable
" set background=dark
" colorscheme solarized
" set t_Co=16 " <https://github.com/sigurdga/gnome-terminal-colors-solarized>

" Use syntax highlighting
syntax on

set smartindent
set expandtab

" Insert Paste
set pastetoggle=<F2>

" Hidden means that buffers undo history are still in history when you switch
" between them http://stackoverflow.com/a/2732336/621449
set hidden

" CtrlP shortcuts I actually still use as of 2022
noremap k :CtrlPBuffer<CR>
noremap l :CtrlP<CR>

set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.hi,*.bc,*.png,*.gif,*.pdf,_site,_cache,target

" Wildmenu (better tab completion????)
set wildmenu

" Sourcings
source ~/.vim/plugin-configs.vim " Source all plugin requirement options

" No delayed "ESC"
set timeoutlen=1000 ttimeoutlen=0

" https://app.asana.com/0/2677909504410/10631479299225
" Basically, <Leader>p is same as paste from clipboard
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>y "+y
noremap <Leader>Y "+Y

" Make backspace work again.
" When I removed NeoComplCache, backspace stopped working for some reason
"
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" 
" That webpage says: "Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete over line breaks"
set backspace=indent,eol,start

" http://stackoverflow.com/a/4255960
"
" Keep window position when switching between buffers.
"
" I never saw any breakage after adding this but I didn't notice that much
" problems with this before adding this either.
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" http://stackoverflow.com/a/8292950
"
" Keep cursor column when switching between buffers.
set nostartofline

" In combination with tmux, vim behaves weirdly on <Ctrl>+ArrowLeft
" http://superuser.com/a/402084/97600
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Prefer vertical diff over horizontal
"
" I noticed this due to that `:Gd` started to do horizontal diffs which are
" useless. One could do `:Gvdiff` to make the diff vertical, but I don't yet
" understand why one would ever want horizontal diffs.
"
" https://github.com/tpope/vim-fugitive/issues/523
set diffopt+=vertical


