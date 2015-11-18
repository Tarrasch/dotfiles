if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


" Main plugins
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'danro/rename.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'moll/vim-bbye' " Provides :Bdelete command
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/localvimrc'
NeoBundle 'xolox/vim-misc'

" From now on I don't sort the list anymore, I'll just append here
NeoBundle 'dahu/vim-fanfingtastic'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'solarnz/arcanist.vim'
NeoBundle 'jlfwong/vim-arcanist'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'qualiabyte/vim-colorstepper'
NeoBundle 'derekwyatt/vim-scala'

let g:neobundle#install_process_timeout = 1800  "YouCompleteMe is so slow
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \   'unix' : './install.sh'
            \ },
\ }

" NeoBundle 'vim-scripts/groovyindent'  " Gives me stack traces wtf
NeoBundle 'guns/vim-clojure-static'

" The easy* plugins
" https://app.asana.com/0/7514515131835/10893630261974
" I set >= 7.4 dependency so it doesn't complain on startups //Arash
NeoBundle 'easymotion/vim-easymotion', {
    \   'vim_version' : '7.4'
    \ }
NeoBundle 'haya14busa/vim-easyoperator-phrase', {
    \   'vim_version' : '7.4'
    \ }
NeoBundle 'haya14busa/vim-easyoperator-line', {
    \   'vim_version' : '7.4'
    \ }

call neobundle#end()

" Required: (says NeoBundle README)
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
