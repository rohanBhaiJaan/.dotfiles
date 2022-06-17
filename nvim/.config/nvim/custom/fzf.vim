if exists("g:loaded_my_fzf")
  finish
endif

let g:loaded_my_fzf = 1
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_layout = { 'down': '~60%' }

nnoremap <C-P> :GitFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>
