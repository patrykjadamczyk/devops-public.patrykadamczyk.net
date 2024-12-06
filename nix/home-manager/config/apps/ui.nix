{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # Clipboard manager
    copyq
    # GnuPG
    gpa
    # Media
    mpv
    ffmpeg
    ffmpegthumbnailer
    # UI Tools
    gparted
    audacity
    smplayer
    gimp
    inkscape-with-extensions
    rnote
    xournalpp
    vlc
    # obs-studio
    # discord
    # spotify
    filezilla
    qbittorrent
    # zeal
    # vivaldi
    inputs.nix-software-center.packages.${system}.nix-software-center
    # inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
    # godot_4
    # godot3-mono
    # qutebrowser
    # luakit
    zathura
    streamlink
    streamlink-twitch-gui-bin
    wxhexeditor
    sylpheed
    himalaya
    # nyxt

    # desktop
    awesome
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs = {
  };

  nixpkgs = {
    config = {
    };
  };
}
