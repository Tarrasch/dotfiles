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
" NeoBundle 'dag/vim2hs' " https://github.com/dag/vim2hs/issues/70
NeoBundle 'danro/rename.vim'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'klen/python-mode'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'moll/vim-bbye' " Provides :Bdelete command
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'termoshtt/unite-bibtex'
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
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'vim-scripts/localvimrc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'

" From now on I don't sort the list anymore, I'll just append here
NeoBundle 'dahu/vim-fanfingtastic'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'nono/vim-handlebars'  " (Temporary - until Bootcamp 27 is over)
NeoBundle 'groenewege/vim-less' " (Temporary - until Bootcamp 27 is over)

let g:neobundle#install_process_timeout = 1800  "YouCompleteMe is so slow
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \   'unix' : './install.sh'
            \ },
\ }

NeoBundle 'vim-scripts/groovyindent'
NeoBundle 'guns/vim-clojure-static'

" The easy* plugins
" https://app.asana.com/0/7514515131835/10893630261974
" I set >= 7.4 dependency so it doesn't complain on startups //Arash
NeoBundle 'Lokaltog/vim-easymotion', {
    \   'vim_version' : '7.4'
    \ }
NeoBundle 'haya14busa/vim-easyoperator-phrase', {
    \   'vim_version' : '7.4'
    \ }
NeoBundle 'haya14busa/vim-easyoperator-line', {
    \   'vim_version' : '7.4'
    \ }

" " My Bundles here:
" "
" " Note: You don't set neobundle setting in .gvimrc!
" " Original repos on github
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" " vim-scripts repos
" NeoBundle 'L9'
" NeoBundle 'FuzzyFinder'
" NeoBundle 'rails.vim'
" " Non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
" " gist repos
" NeoBundle 'gist:Shougo/656148', {
"       \ 'name': 'everything.vim',
"       \ 'script_type': 'plugin'}
" " Non git repos
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...

call neobundle#end()

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
" NeoBundleCheck  " XXX: Temporary so remote machines don't ask for YCM
