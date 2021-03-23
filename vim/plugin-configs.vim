" vim-airline
set laststatus=2 " Make it appear, even when no splits
let g:airline_powerline_fonts = 1 " Cool fonts

" Ctrl-P
" I want it to use the current folder, not repo root
let g:ctrlp_working_path_mode = '0'
" Also ignore gitignored files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
