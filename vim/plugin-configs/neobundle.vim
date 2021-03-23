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
NeoBundle 'godlygeek/tabular'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'moll/vim-bbye' " Provides :Bdelete command
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-abolish'  " :Subvert/child{,ren}/adult{,s}/g
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-eunuch'  " Add unix commands, like :Rename
NeoBundle 'tpope/vim-fugitive'  " Git plugin
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-tbone'  " Tmux stuff
NeoBundle 'tpope/vim-unimpaired'  " undesrstand paraenthesis
NeoBundle 'vim-scripts/localvimrc'

" From now on I don't sort the list anymore, I'll just append here
NeoBundle 'dahu/vim-fanfingtastic'  " 'Find a char across lines'
NeoBundle 'bronson/vim-visual-star-search' " Start a * or # search from a visual block
NeoBundle 'tpope/vim-sleuth'  " automatically adjusts 'shiftwidth' and 'expandtab'
NeoBundle 'qualiabyte/vim-colorstepper'  " Cycle vim color schemes, F6 and F7 keys
NeoBundle 'Shougo/neoyank.vim'  " yank history includes unite.vim/denite.nvim history/yank source.
NeoBundle 'AndrewRadev/linediff.vim'  " Add :Linediff


" DISABLE UNTIL I REMEMBER HOW TO USE IT.
"       // Arash after forgotteing most of my vim flow.
"
" let g:localSession = ($SSH_CLIENT == "")
" if g:localSession
"   let g:neobundle#install_process_timeout = 1800  "YouCompleteMe is so slow
"   NeoBundle 'Valloric/YouCompleteMe', {
"               \ 'build' : {
"               \   'unix' : './install.sh'
"               \ },
"   \ }
" endif
"
" " The easy* plugins
" " https://app.asana.com/0/7514515131835/10893630261974
" " I set >= 7.4 dependency so it doesn't complain on startups //Arash
" NeoBundle 'easymotion/vim-easymotion', {
"     \   'vim_version' : '7.4'
"     \ }
" NeoBundle 'haya14busa/vim-easyoperator-phrase', {
"     \   'vim_version' : '7.4'
"     \ }
" NeoBundle 'haya14busa/vim-easyoperator-line', {
"     \   'vim_version' : '7.4'
"     \ }

call neobundle#end()

" Required: (says NeoBundle README)
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
