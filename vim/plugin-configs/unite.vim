" Make ESC key close unite
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  " nnoremap <buffer> <ESC>      <Plug>(unite_exit)
endfunction"}}}

" Make ESC key close unite
" autocmd FileType unite call s:unite_my_settings()

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
