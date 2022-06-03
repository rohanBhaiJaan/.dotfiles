" if exists("g:changeMode")
"     echo 'already sourced'
"     finish
" endif

setlocal updatetime=1000

let g:changeMode = 1

function s:setup() abort
    exec 'stopinsert'
    split ~/.local/templates/changeMode.hle
    resize 2
    exec "normal a"
endfunction

augroup changeMode
    autocmd!
    autocmd CursorHoldI * call s:setup()
augroup END
