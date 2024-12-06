set shell := ["nu", "-c"]

# Start all deamon tasks
[group("control")]
default:
    print "Deamon started"
    [neorg vsnip] | par-each {|task| just -g $"deamon::watch-($task)" }

# Watch Neorg
[group("deamon-task")]
watch-neorg:
    print "Watch Deamon for Neorg files started"
    cd ~/.config/neorg; watch . --glob=**/*.* {|_, path| if ($path | str contains ".git") { print $"(ansi blue)INFO(ansi reset): Change detected in .git. ignoring..." } else { print $"(ansi blue)INFO(ansi reset): Change detected. committing..."; git add -A; try { git commit -am "Git Automatic Synchronisation" }; git push } }

# Watch Snippets
[group("deamon-task")]
watch-vsnip:
    print "Watch Deamon for Snippets files started"
    cd ~/.vsnip; watch . --glob=**/*.* {|_, path| if ($path | str contains ".git") { print $"(ansi blue)INFO(ansi reset): Change detected in .git. ignoring..." } else { print $"(ansi blue)INFO(ansi reset): Change detected. committing..."; git add -A; try { git commit -am "Git Automatic Synchronisation" }; git push } }

# Start Tmux session with deamon process of just+nushell
[group("control")]
start-tmux:
    tmux new -s "GitAutoSync" just -g deamon

# Attach to tmux session with deamon process of just+nushell
[group("control")]
attach-tmux:
    tmux attach -t GitAutoSync
