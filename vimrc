call pathogen#infect()

" No vi comptiblilty (I think) /Arash
set nocompatible

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

" Change colorscheme
colorscheme delek

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

" LustyExplorer told me to do this on startup //Arash
set hidden

" Nice shortcut for hlb, Lusty stuff
nmap k :LustyBufferExplorer<CR>
nmap K :LustyBufferGrep<CR>
nmap l :LustyFilesystemExplorer<CR>
nmap L :LustyFilesystemExplorerFromHere<CR>

set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.hi,*.bc,*.png,*.d,*.gif,*.pdf

" Wildmenu
set wildmenu

" Sourcings
source ~/.vim/find.vim
source ~/.vim/cyclecolor.vim
source ~/.vim/plugins-configs.vim " Source all plugin requirement options
