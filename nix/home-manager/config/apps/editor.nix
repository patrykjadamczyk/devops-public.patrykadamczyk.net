{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # My Main Editor

    # Currently ignored because i'm using bob
    # URL: https://github.com/MordechaiHadad/bob

    # neovim # Ignored currently because i'm using nightly
    # neovim-nightly
    # neovim-qt
    # neovide # Ignored currently
    # My additional editors
    # helix
    lunarvim
    lite-xl
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "moar";
  };

  programs = {
    helix = {
        enable = true;
    };
    # neovim = {
    #     enable = true;
    # };
  };

  nixpkgs = {
    config = {
    };
  };
  fonts.fontconfig.enable = true;
}
