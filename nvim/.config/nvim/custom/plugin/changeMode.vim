" changeMode.vim - Notify you to change mode to normal mode
"                when you take more than 2sec brake in insert mode
" Author:       Rohan Kamble
" Version:      1.2

if exists("g:changeMode")
    echo 'already sourced'
    finish
endif
let g:changeMode = 1
setlocal updatetime=2000

let s:open = 0

function s:close() abort
    let l:globalWinId = bufnr('~/.local/templates/changeMode.hle')
    let l:dotfileWinId = bufnr('~/.dotfiles/local/.local/templates/changeMode.hle')
    if l:globalWinId >= 0 || l:dotfileWinId >= 0
        silent! bdelete ~/.local/templates/changeMode.hle
        silent! bdelete ~/.dotfiles/local/.local/templates/changeMode.hle
    endif
endfunction

function s:insert_close() abort
    if s:open != 0
        call s:close()
        let s:open = 0
    endif
endfunction

function s:setup() abort
    exec 'stopinsert'
    let l:pos = getpos('.')
    split ~/.local/templates/changeMode.hle
    resize 2
    exec "normal "
    call cursor(l:pos[1], l:pos[2])
    exec "normal a"
    let s:open = 1
endfunction

augroup changeMode
    autocmd!
    autocmd CursorHoldI * call s:setup()
    autocmd CursorMovedI * call s:insert_close()
    autocmd InsertLeave * call s:close()
augroup END
