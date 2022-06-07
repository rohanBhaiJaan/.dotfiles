if exists("g:My_CP_set")
    echo "custom cp setup already sourced"
    finish
endif
let g:My_CP_set = 1

let g:cpFileHeadName = expand('%:t:r')
let g:cpFileName = expand('%:t')

function! s:closeSplitSetupForCP()
    bdelete ~/.compiled/input.in
    bdelete ~/.compiled/output.in
endfunction

function! s:SplitSetupForCPP()
    let l:cpFileName = expand('%:h:t')
    if(winnr('$') <= 2)
        execute 'silent keepalt vs ~/.compiled/input.in | vertical resize 24 | silent keepalt split ~/.compiled/output.in'
    elseif(bufexists(g:cpFileName) && (bufnr('~/.compiled/input.in') > 0 || bufnr('~/.compiled/output.in') > 0))
        call s:closeSplitSetupForCP()
    else
        echo "PLESE OPEN CPP FILE "
    endif
endfunction

function! s:RunCode()
    execute '!~/.compiled/'. g:cpFileHeadName .'<~/.compiled/input.in> ~/.compiled/output.in'
endfunction

function! s:CompileAndRun()
    execute '!g++ '.g:cpFileName.' -o ~/.compiled/'. g:cpFileHeadName .' 2> ~/.compiled/output.in && ~/.compiled/'. g:cpFileHeadName .'<~/.compiled/input.in>~/.compiled/output.in'
endfunction

augroup CP
    autocmd FILETYPE cpp,h nnoremap <leader>s :call <SID>SplitSetupForCPP()<CR>
    autocmd FILETYPE cpp,h nnoremap <leader>r :call <SID>RunCode()<CR>
    autocmd FILETYPE cpp,h nnoremap <leader>cr :call <SID>CompileAndRun()<CR>
    autocmd FILETYPE c,h,cpp set tabstop=2 softtabstop=2 shiftwidth=2 | set foldmethod=indent
    autocmd BufEnter *.cpp let g:cpFileName = expand('%:t')
    autocmd BufEnter *.cpp let g:cpFileHeadName = expand('%:t')
augroup END

