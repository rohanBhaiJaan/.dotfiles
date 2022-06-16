if !has("nvim")
    if filereadable(expand("~/.vim/temp_setting.vim"))
        source ~/.vim/temp_setting.vim
    else 
        echo "you can use ~/.vim/temp_setting.vim for temporary setting"
    endif
endif
