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
NeoBundle 'tpope/vim-dispatch'
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
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'ludovicchabant/vim-gutentags'  "  Manages your tag files (Arash still dont know how/if it works)
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'AndrewRadev/linediff.vim'  " Add :Linediff


NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/vim-easyoperator-phrase'
NeoBundle 'haya14busa/vim-easyoperator-line'

call neobundle#end()

" Required: (says NeoBundle README)
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
