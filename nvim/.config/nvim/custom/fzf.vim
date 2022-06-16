if exists("g:loaded_my_fzf") || !exists("g:loaded_fzf_vim")
  finish
endif
let g:loaded_my_fzf = 1
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_layout = { 'down': '~60%' }
