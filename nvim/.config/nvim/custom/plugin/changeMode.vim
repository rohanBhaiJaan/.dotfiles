" changeMode.vim - Notify you to change mode to normal mode
"                when you take more than 2sec brake in insert mode
" Author:       Rohan Kamble
" Version:      2.0

if exists("g:changeMode")
    echo 'already sourced'
    finish
endif
let g:changeMode = 1
setlocal updatetime=2000

augroup changeMode
    autocmd!
    autocmd CursorHoldI * call popup_atcursor("type or change mode", #{
    \ pos: "topleft",
    \ line: "cursor+1",
    \ col: "cursor",
    \ moved: "any",
    \ })
augroup END
