" Vim compiler file for Haskell
" Compiler:     hlint frontend
" Maintainer:   Michael Rueegg <rueegg.michael@gmail.com>
" Last Change:  2010 August 27
" Version:      0.1
"
" Installation:
"   Drop hlint.vim in your ~/.vim/compiler directory. Please also make
"   sure that your PATH environment variable includes the path to the 
"   'hlint' executable.
"
"   Add the following line to the autocmd section of .vimrc
"
"      autocmd FileType haskell compiler hlint
"
" Usage:
"   hlint is called after a buffer with Haskell code is saved. QuickFix
"   window is opened to show errors, warnings and hints provided by hlint.
"
"   Above is realized with :Hlint command. To disable calling hlint every
"   time a buffer is saved put into .vimrc file
"
"       let g:hlint_onwrite = 0
"
"   Opening of QuickFix window can be disabled with
"
"       let g:hlint_cwindow = 0
"
"   Setting signs for the lines with errors can be disabled with
"
"	    let g:hlint_signs = 0
"
"   Of course, standard :make command can be used as in case of every
"   other compiler.
"

if exists('current_compiler')
    finish
endif
let current_compiler = 'hlint'

if !exists('g:hlint_onwrite')
    let g:hlint_onwrite = 1
endif

if !exists('g:hlint_cwindow')
    let g:hlint_cwindow = 1
endif

if !exists('g:hlint_signs')
    let g:hlint_signs = 1
endif

if exists(':Hlint') != 2
    command Hlint :call Hlint(0)
endif

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif


" Compiler program call
"
" Typical hlint message looks like this:
" Parse.hs:71:5: Warning: Eta reduce
" Found:
"   fmap f parser = parser ==> \ result -> identity (f result)
" Why not:
"   fmap f = (==> \ result -> identity (f result))
"
" command:
" hlint xyz.hs | sed 's/^[ \t]*//' | awk '/.+/ { printf "%s ", $0; next } {print}' |
" sed 's/\(Found:\)/| \1/' | sed 's/\(Why not:\)/| \1/' | 
" sed 's/\(.*\):\([1-9][0-9]*\):\([1-9][0-9]*\):\s\([A-Za-z]*\):/\4:\3:\2/' | 
" sed -e 's/^Warning/2 W/' -e 's/^Error/1 E/' | sort -k1,3
"
CompilerSet makeprg=(hlint\ %\ \\\|sed\ \'s/^[\ \t]*//\'\ \\\|
            \awk\ \'/.+/\ {\ printf\ \"\\%s\ \",\ $0;\ next\ }\ {print}\'\ \\\|
            \sed\ \'s/\\(Found:\\)/\\\|\ \\1/\'\ \\\|
            \sed\ \'s/\\(Why\ not:\\)/\\\|\ \\1/\'\ \\\|
            \sed\ \'s/[^:]*:\\([1-9][0-9]*\\):\\([1-9][0-9]*\\)
            \:\\s\\([a-zA-Z]*\\):/\\3:\\1:\\2/\'\ \\\|
            \sed\ -e\ \'s/^Warning/2\ W/\'\ -e\ \'s/^Error/1\ E/\'\ \\\|
            \sort\ -k1,3)


" Compiler format message
" 
" Format of compiler program call:
" 2 W:42:99 Eta reduce; Found \ bs -> identity (b : bs); Why not identity . (b :
CompilerSet efm=%\\d\ %t:%l:%c\ %m                           
 
sign define W text=WW texthl=hlint
sign define E text=EE texthl=hlint_error

if g:hlint_onwrite
    augroup haskell
        au!
        au BufWritePost * call Hlint(1)
    augroup end
endif

function! Hlint(writing)
    if !a:writing && &modified
        write
    endif	

    if has('win32') || has('win16') || has('win95') || has('win64')
        setlocal sp=>%s
    else
        setlocal sp=>%s\ 2>&1
    endif

    if !a:writing
        silent make
    else
        silent make!
    endif

    if g:hlint_cwindow
        cwindow
    endif

    if g:hlint_signs
        call PlaceHlintSigns()
    endif
endfunction

function! PlaceHlintSigns()
    let l:buffr = bufname('%')

    if empty(l:buffr)
        let l:buffr=bufname(1)
    endif

    exec('sign unplace *')

    let l:list = getqflist()
    let l:id = 1

    for l:item in l:list
	let l:lnum=item.lnum
	let l:type=item.type
        if l:type == 'W' || l:type == 'E'
            let l:exec = printf('sign place %d name=%s line=%d file=%s',
	                        \ l:id, l:type, l:lnum, l:buffr)
            let l:id = l:id + 1
	        execute l:exec
        endif
    endfor
endfunction

