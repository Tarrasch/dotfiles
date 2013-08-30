" haskell mode from pbrisbin
" haskellmode-vim needs these set as early as possible
let g:haddock_browser = $BROWSER
let g:haddock_indexfiledir = $HOME . '/.vim/'
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

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

" For ack plugin (Ubuntu only)
noremap <Leader># "ayiw:Ack <C-r>a<CR>
vnoremap <Leader># "ay:Ack <C-r>a<CR>
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" For haskell template languages
au BufEnter *.hamlet  setlocal filetype=hamlet
au BufEnter *.cassius setlocal filetype=cassius
au BufEnter *.julius  setlocal filetype=julius

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
source ~/.vim/plugin-configs/neocomplcache.vim " Source all plugin requirement options

" Things all of unite uses
source ~/.vim/plugin-configs/unite-common.vim

" Unite
source ~/.vim/plugin-configs/unite.vim

" VimFiler
source ~/.vim/plugin-configs/vimfiler.vim

" vim-airline
set laststatus=2 " Make it appear, even when no splits
let g:airline_powerline_fonts = 1 " Cool fonts
