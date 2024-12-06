#!/usr/bin/env nu

# Like current playing song on Spotify
alias "spotify-like" = ^spotify_player like
# Remove like from current playing song on Spotify
alias "spotify-unlike" = ^spotify_player like -u
# Resume playback Spotify
alias "spotify-resume" = ^spotify_player playback play
# Pause playback Spotify
alias "spotify-pause" = ^spotify_player playback pause
# Go to next song on Spotify
alias "spotify-next" = ^spotify_player playback next
# Go to previous song on Spotify
alias "spotify-prev" = ^spotify_player playback previous
# Cycle through repeat modes on Spotify
alias "spotify-repeat" = ^spotify_player playback repeat
# Toggle shuffle on Spotify
alias "spotify-shuffle" = ^spotify_player playback shuffle
# Set volume on Spotify
alias "spotify-vol" = ^spotify_player playback volume
# Set volume by offset (+/-) on Spotify
alias "spotify-voloff" = ^spotify_player playback volume --offset --

# Generate Spotify Authentication Token File
def "spotify-gen-authtoken" [] {
    let redirect_uri = "http://localhost:7777"
    let client_id = (open ~/go/src/devops.patrykadamczyk.net/dotfiles/spotify/keys.env.json).client_id
    let scopes = "user-library-read"

    print "Getting token..."
    # Open url in default browser using stuff like xdg-open
    fopen $"https://accounts.spotify.com/authorize?client_id=($client_id)&response_type=token&redirect_uri=($redirect_uri)&scope=($scopes)"
    print "Request sent"

    let redirect_url = (input -s "Paste url here: ")

    # This gets token from url
    let token = ($redirect_url | from url | get "http://localhost:7777/#access_token")

    echo $'{"token": "($token)"}' | save -f ~/go/src/devops.patrykadamczyk.net/dotfiles/spotify/token.env.json
}

# Check whether current song is liked or not
def "spotify-iscurrentliked" [] {
    let $token = (open ~/go/src/devops.patrykadamczyk.net/dotfiles/spotify/token.env.json).token
    let $current_song_id = (^spotify_player get key playback | from json | get item | get id)
    return (
        http get -H [ "Authorization" $"Bearer ($token)" ] $"https://api.spotify.com/v1/me/tracks/contains?ids=($current_song_id)"
    )
}
