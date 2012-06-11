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

" For textobj-rubyblock
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif

" For ack plugin (Ubuntu only)
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" For haskell template languages
au BufEnter *.hamlet  setlocal filetype=hamlet
au BufEnter *.cassius setlocal filetype=cassius
au BufEnter *.julius  setlocal filetype=julius
