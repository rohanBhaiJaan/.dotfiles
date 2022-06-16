" changeMode.vim - Notify you to change mode to normal mode
"                when you take more than 2sec brake in insert mode
" Author:       Rohan Kamble
" Version:      2.0

if exists("g:changeMode") || has('nvim')
    finish
endif

if ! exists("g:changeMode_waitTime")
    let g:changeMode_waitTime = 2000
endif

let g:changeMode = 1
let &updatetime = g:changeMode_waitTime

augroup changeMode
    autocmd!
    autocmd CursorHoldI * call popup_atcursor("type or change mode", #{
    \ pos: "topleft",
    \ line: "cursor+1",
    \ col: "cursor",
    \ moved: "any",
    \ })
augroup END
