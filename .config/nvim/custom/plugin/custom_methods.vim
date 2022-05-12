if exists("g:NERDTree")
    let g:NERDTreeWinSize=19

    " CUSTOM VARIABLES
    let g:NerdTreeWidth = 20

    function! g:SetNerdTreeWidth(width)
        let g:NerdTreeWidth = a:width
        let g:NERDTreeWinSize = g:NerdTreeWidth
    endfunction

    function! g:NerdTreeToggle()
        if g:NerdTreeWidth != g:NERDTreeWinSize
            call g:SetNerdTreeWidth(g:NerdTreeWidth)
        endif

        if exists('g:NERDTree') && g:NERDTree.IsOpen()
            execute 'NERDTreeClose'
        else
            execute 'NERDTree'
        endif
    endfunction

    augroup All
        autocmd! VimEnter * NERDTree
        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    augroup END
endif
