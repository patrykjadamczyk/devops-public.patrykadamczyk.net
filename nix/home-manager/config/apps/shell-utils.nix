{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # Shell scripts utilities
    shellcheck
    # Shell utilities
    # tmux
    tree
    lsof
    whois
    broot
    aria2
    jq
    lsd
    eza
    starship
    zoxide
    curl
    wget
    du-dust
    exiftool
    glow
    gum
    gotop
    gnutls
    gping
    grex
    httpie
    hyperfine
    tldr
    tree-sitter
    unar
    yazi
    # zellij
    chroma
    moar
    cheat
    hostctl
    # man
    # Grep alternative - used by telescope
    ripgrep
    ripgrep-all
    # Find alternative - used by telescope
    fd
    # Sed Alternative
    sd
    # Ack Alternative
    silver-searcher
    # Fuzzy Finder
    fzf
    # Lines of code counter
    tokei
    # Auto restarter on file change
    entr
    # MimeType Finder
    file
    # Core utils
    uutils-coreutils
    coreutils-full
    # More unix utilities (best ones: vipe for inspecting pipes in editor, sponge which works like > but can use sudo)
    moreutils
    # Disk usage analyzer
    ncdu
    # HTOP
    htop
    # Password utilties
    pass
    pup
    pwgen
    # Archives
    # rar
    zip
    unzip
    brotli
    bzip2
    p7zip
    # Web Browsers
    w3m
    lynx
    links2
    # Nix utilities
    # nix # You can't use home manager for that at all (don't even try)
    nix-prefetch-scripts
    cachix
    # GnuPG
    gnupg
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs = {
    direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
    starship = {
        enable = true;
    };
    lsd = {
        enable = true;
    };
    # bat = {
    #     enable = true;
    # };
    zoxide = {
        enable = true;
    };
    jq = {
        enable = true;
    };
    htop = {
        enable = true;
    };
    zellij = {
        enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      defaultCommand = "rg --files";
    };
  };

  nixpkgs = {
    config = {
    };
  };
  fonts.fontconfig.enable = true;
}
