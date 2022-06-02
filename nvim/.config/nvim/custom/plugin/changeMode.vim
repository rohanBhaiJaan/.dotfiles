" if exists("g:changeMode")
"     echo 'already sourced'
"     finish
" endif

setlocal updatetime=1500

let g:changeMode = 1

function s:setup() abort
    exec 'stopinsert'
    split ~/.local/templates/changeMode.hle
    exec "normal gi"
endfunction

augroup changeMode
    autocmd!
    autocmd CursorHoldI * call s:setup()
augroup END
