" No vi comptiblilty (I think) /Arash
set nocompatible

" NeoBundle
source ~/.vim/plugin-configs/neobundle.vim

" Tags
set tags=./tags;/

" Taken from vimcast 'bubbling text'
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Turn on line numbering. Turn it off with "set nonu"
set nu

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Higlhight search
set hls

set incsearch     " show search matches as you type

" Wrap text instead of being on one line
set lbr

" Set solarized (from `:help solarized`)
syntax enable
set background=dark
colorscheme solarized
set t_Co=16 " <https://github.com/sigurdga/gnome-terminal-colors-solarized>

" Use syntax highlighting
syntax on

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" Insert Paste
set pastetoggle=<F2>

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Hidden means that buffers undo history are still in history when you switch
" between them http://stackoverflow.com/a/2732336/621449
set hidden

" Estimate of the old shortcuts I had for Lusty etc.
nmap k :CtrlPBuffer<CR>
nmap l :CtrlP<CR>

" I start off without extensions to start off easy and lightweight
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
      \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']


set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.hi,*.bc,*.png,*.d,*.gif,*.pdf,_site,_cache

" Wildmenu
set wildmenu

" Sourcings
source ~/.vim/find.vim
source ~/.vim/cyclecolor.vim
source ~/.vim/plugin-configs.vim " Source all plugin requirement options
