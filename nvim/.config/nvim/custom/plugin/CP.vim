if exists("g:loaded_My_CP")
    finish
endif
let g:loaded_My_CP = 1

let g:cpExt = expand("%:e")

let g:cpFileHeadName = expand('%:t:r')
let g:cpFilePath = expand('%:p')

function! s:closeSplitSetupForCP()
    bdelete ~/.compiled/input.in
    bdelete ~/.compiled/output.in
endfunction

function! s:SplitSetupForCPP()
    if(winnr('$') <= 2)
        execute 'silent keepalt vs ~/.compiled/input.in | vertical resize 24 | silent keepalt split ~/.compiled/output.in'
    elseif(bufexists(g:cpFilePath) && (bufnr('~/.compiled/input.in') > 0 || bufnr('~/.compiled/output.in') > 0))
        call s:closeSplitSetupForCP()
    else
        echo "PLESE OPEN CPP FILE "
    endif
endfunction

function! s:RunCode()
    execute '!~/.compiled/'. g:cpFileHeadName .'<~/.compiled/input.in> ~/.compiled/output.in'
endfunction

function! s:CompileAndRun()
    if g:cpExt == "cpp"
        execute '!g++ '.g:cpFilePath.' -o ~/.compiled/'. g:cpFileHeadName .' 2> ~/.compiled/output.in && ~/.compiled/'. g:cpFileHeadName .'<~/.compiled/input.in>~/.compiled/output.in'
    elseif g:cpExt == "c"
        execute '!clang '.g:cpFilePath.' -o ~/.compiled/'. g:cpFileHeadName .' 3> ~/.compiled/output.in && ~/.compiled/'. g:cpFileHeadName .'<~/.compiled/input.in>~/.compiled/output.in'
    endif
endfunction

augroup CP
    autocmd FILETYPE c,h,cpp nnoremap <leader>s :call <SID>SplitSetupForCPP()<CR>
    autocmd FILETYPE c,h,cpp nnoremap <leader>r :call <SID>RunCode()<CR>
    autocmd FILETYPE c,h,cpp nnoremap <leader>cr :call <SID>CompileAndRun()<CR>
    autocmd BufEnter *.c,*.h,*.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd InsertEnter *.c,*.h,*.cpp setlocal foldmethod=manual
    autocmd BufEnter *.cpp,*.c let g:cpFilePath = expand('%:t') | let g:cpExt = expand('%:e')
    autocmd InsertLeave *.c,*.h,*.cpp setlocal foldmethod=indent
augroup END

