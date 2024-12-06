" ================= Syntax Highlighting =================
" Create autocommand that overrides filetypes based on extension
autocmd BufEnter,BufWinEnter *.md set filetype=markdown
autocmd BufEnter,BufWinEnter *.{jscs,jshint,eslint}rc set filetype=json
autocmd BufEnter,BufWinEnter gitconfig.local set filetype=gitconfig
autocmd BufEnter,BufWinEnter tmux.conf.local set filetype=tmux
autocmd BufEnter,BufWinEnter vimrc.local set filetype=vim
autocmd BufEnter,BufWinEnter *.plist set filetype=xml
autocmd BufEnter,BufWinEnter vlang set filetype=vlang
autocmd BufEnter,BufWinEnter *.{v,vsh,vv} set filetype=vlang
autocmd BufEnter,BufWinEnter v.mod set filetype=vlang
autocmd BufEnter,BufWinEnter nim set filetype=nim
autocmd BufEnter,BufWinEnter *.{nim,nims,nim.cfg,nimble} set filetype=nim
autocmd BufEnter,BufWinEnter nim.cfg set filetype=nim
autocmd BufEnter,BufWinEnter csv set filetype=csv
autocmd BufEnter,BufWinEnter *.{csv,dat} set filetype=csv
autocmd BufEnter,BufWinEnter log set filetype=log
autocmd BufEnter,BufWinEnter */log/{auth,cron,daemon,debug,kern,lpr,mail,messages,news/news,syslog,user}{,.log,.err,.info,.warn,.crit,.notice}{,.[0-9]*,-[0-9]*} set filetype=messages
autocmd BufEnter,BufWinEnter hurl set filetype=hurl
autocmd BufEnter,BufWinEnter *.hurl set filetype=hurl
" Language Overrides
autocmd BufEnter,BufWinEnter *.go set tabstop=4
autocmd BufEnter,BufWinEnter *.go set shiftwidth=4

