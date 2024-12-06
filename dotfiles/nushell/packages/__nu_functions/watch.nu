#!/usr/bin/env nu

# Watch
alias watch-video = ^mpv

# Watch TV
# NOTE: This is not working correctly because parts divided by spaces iin alias name are passed through as arguments

# alias "watch-video tv" = mpv "https://raw.githubusercontent.com/Free-TV/IPTV/master/playlist.m3u8"
def --env "watch-video tv" [] {
    mpv "https://raw.githubusercontent.com/Free-TV/IPTV/master/playlist.m3u8"
}

# Run play-with-mpv server
# NOTE: This is not working correctly because parts divided by spaces iin alias name are passed through as arguments

# alias "watch-video server" = python3 ~/go/src/github.com/Thann/play-with-mpv/play_with_mpv.py --public
def --env "watch-video server" [] {
    python3 ~/go/src/github.com/Thann/play-with-mpv/play_with_mpv.py --public
}

# Watch video on localhost
def --env "watch-video on localhost" [
    $url: string
] {
    let $server_url = "http://127.0.0.1:7531"
    let $query = $"?play_url=($url | url encode)"
    http get $"($server_url)/($query)"
}
