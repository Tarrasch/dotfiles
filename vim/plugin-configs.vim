" For ag plugin (Ubuntu only)
noremap <Leader># "ayiw:Ag <C-r>a<CR>
vnoremap <Leader># "ay:Ag <C-r>a<CR>

" Unite
source ~/.vim/plugin-configs/unite.vim

" If I don't set this I'll never use it otherwise
let g:vimfiler_as_default_explorer = 1

" vim-airline
set laststatus=2 " Make it appear, even when no splits
let g:airline_powerline_fonts = 1 " Cool fonts

" Easmotion, it's a trade off here, I choose the "slower" binding that on the
" other hand is less likely to clog with other bindings
let g:EasyMotion_leader_key = '<Leader><Leader>'
" default:              'asdghklqwertyuiopzxcvbnmfj;'
let g:EasyMotion_keys = 'arsdheiqwfpgjluy;zxcvbkmtno' " Colemak

" I (Arash) choose to not use the default easyoperator bindings but bind it in
" the way I'm used to since before, I found the default bindings of 4
" characters to be too long (altough maybe more logical).
" easyoperator-line
let g:EasyOperator_line_do_mapping = 0
omap u                           <Plug>(easyoperator-line-select)
xmap <Plug>(easymotion-prefix)u  <Plug>(easyoperator-line-select)
nmap du                          <Plug>(easyoperator-line-delete)
nmap yu                          <Plug>(easyoperator-line-yank)
" Hint: xmap == vmap   (almost) // Arash
" Note: the last two might seem to be redundant of the :omap one, but they
" actually implement cursor jump-backs which is very nice. :) // Arash

let g:EasyOperator_phrase_do_mapping = 0
omap y                           <Plug>(easyoperator-phrase-select)
xmap <Plug>(easymotion-prefix)y  <Plug>(easyoperator-phrase-select)
nmap dy                          <Plug>(easyoperator-phrase-delete)
nmap yy                          <Plug>(easyoperator-phrase-yank)

" Surround, add latex support, see
" https://github.com/tpope/vim-surround/issues/47
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

" Ctrl-P
" I want it to use the current folder, not repo root
let g:ctrlp_working_path_mode = '0'


" Easytags
" Since exuberant-ctags isn't always installed on machines I ssh into, I don't
" want to get a warning each time i open up vim
let g:easytags_suppress_ctags_warning = 1


" Syntastic
" Stuff regarding using python 3 (which I do at VNG)
let g:syntastic_python_python_exec = 'python3'

" For this it is required to do
" pip3 install --upgrade --user flake8
" See http://stackoverflow.com/a/29195533/621449
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
