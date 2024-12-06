let g:nvimrc = stdpath("config")
exec "source " . g:nvimrc . "/utils.lua.vim"
if g:is_nvim
    exec "source " . g:nvimrc . "/special.lua"
endif
exec "source " . g:nvimrc . "/vim.vim"
exec "source " . g:nvimrc . "/keymaps.vim"
exec "source " . g:nvimrc . "/syntax.lua.vim"
exec "source " . g:nvimrc . "/config.vim"
exec "source " . g:nvimrc . "/config.lua.vim"
exec "source " . g:nvimrc . "/finish.lua.vim"
