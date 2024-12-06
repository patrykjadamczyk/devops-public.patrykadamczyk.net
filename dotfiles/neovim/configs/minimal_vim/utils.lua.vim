let g:is_win = (has("win32") == 1 || has("win64") == 1) ? 1 : 0
let g:is_linux = (has("unix") == 1 && !has("macunix") == 1) ? 1 : 0
let g:is_mac = has("macunix") == 1 ? 1 : 0
let g:nvimrc = stdpath("config")
let g:is_nvim = has("nvim") == 1 ? 1 : 0
