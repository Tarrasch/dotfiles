call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" haskell mode from pbrisbin
" haskellmode-vim needs these set as early as possible
let g:haddock_browser = $BROWSER
let g:haddock_indexfiledir = $HOME . '/.vim/'
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc





" Turn on line numbering. Turn it off with "set nonu"
set nu

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Case insensitive search
set ic

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Load cyclecolor
source ~/.vim/cyclecolor.vim

" Change colorscheme
colorscheme delek

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" For haskell template languages
au BufEnter *.hamlet  setlocal filetype=hamlet
au BufEnter *.cassius setlocal filetype=cassius
au BufEnter *.julius  setlocal filetype=julius

" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

source ~/.vim/colqer.vim

" Hlint support
autocmd FileType haskell compiler hlint
"   Above is realized with :Hlint command. To disable calling hlint every
"   time a buffer is saved put into .vimrc file
"
       let g:hlint_onwrite = 0
"
"   Opening of QuickFix window can be disabled with
"
"       let g:hlint_cwindow = 0
"
"   Setting signs for the lines with errors can be disabled with
"
"       let g:hlint_signs = 0

"  Tabular
let mapleader=","
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"  Tabular auto-indent |
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Insert Paste
set pastetoggle=<F2>

" Remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
