if exists("g:neovide")
    " set guifont=IosevkaTerm\ NFM\ SemiBold:h16,IosevkaTerm\ Nerd\ Font\ Mono:h16,JetBrainsMono\ NFM:h16,JetBrainsMono\ Nerd\ Font\ Mono:h16
    " set guifont=IosevkaTerm\ NFM\ SemiBold,IosevkaTerm\ Nerd\ Font\ Mono,JetBrainsMono\ NFM,JetBrainsMono\ Nerd\ Font\ Mono:h16
    " set guifont=IosevkaTerm_NFM_SemiBold,IosevkaTerm_Nerd_Font_Mono,JetBrainsMono_NFM,JetBrainsMono_Nerd_Font_Mono:h16
    set guifont=IosevkaTerm_Nerd_Font_Mono,IosevkaTerm_NFM_SemiBold,JetBrainsMono_NFM,JetBrainsMono_Nerd_Font_Mono:h15
    let g:neovide_transparency = 0.8
    let g:neovide_theme = "dark"
    let g:neovide_fullscreen = v:false
    let g:neovide_cursor_animation_length = 0
    function! ToggleNeovideFullscreen()
        let g:neovide_fullscreen = !g:neovide_fullscreen
    endfunction
    nnoremap <A-Enter> <cmd>call ToggleNeovideFullscreen()<CR>
    nnoremap <M-Enter> <cmd>call ToggleNeovideFullscreen()<CR>
    nnoremap <F11> <cmd>call ToggleNeovideFullscreen()<CR>
endif
