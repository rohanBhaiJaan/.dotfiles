let s:fileHeadName = expand('%:t:r')
let s:fileName = expand('%:t')

function! s:closeSplitSetupForCP()
    bdelete ~/.compiled/input.in
    bdelete ~/.compiled/output.in
endfunction

function! g:SplitSetupForCPP()
    let l:fileName = expand('%:h:t')
    if(winnr('$') <= 2)
        execute 'vs ~/.compiled/input.in | vertical resize 24 | split ~/.compiled/output.in'
    elseif(bufexists(s:fileName) && (bufnr('~/.compiled/input.in') > 0 || bufnr('~/.compiled/output.in') > 0))
        call s:closeSplitSetupForCP()
    else
        echo "PLESE OPEN CPP FILE "
    endif
endfunction

function! g:RunCode()
    execute '!~/.compiled/'. s:fileHeadName .'<~/.compiled/input.in> ~/.compiled/output.in'
endfunction

function! g:CompileAndRun()
    execute '!g++ '.s:fileName.' -o ~/.compiled/'. s:fileHeadName .' 2> ~/.compiled/output.in && ~/.compiled/'. s:fileHeadName .'<~/.compiled/input.in>~/.compiled/output.in'
endfunction

augroup CP
    autocmd FILETYPE cpp nnoremap <F3> :call SplitSetupForCPP()<CR>
    autocmd FILETYPE cpp nnoremap <F5> :call RunCode()<CR>
    autocmd FILETYPE cpp nnoremap <F8> :call CompileAndRun()<CR>
augroup END

