{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # My Main Terminal
    # wezterm
    # My additional terminals
    # alacritty
    # My Main Shell
    # powershell
    # Additional Shells
    # bashInteractive
    zsh
    #nushellFull
    hilbish
    oh
    oil
    xonsh
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs = {
    # nushell = {
    #     enable = true;
    # };
    # bash = {
    #     enable = true;
    # };
    # zsh = {
    #     enable = true;
    # };
  };

  nixpkgs = {
    config = {
    };
  };
  fonts.fontconfig.enable = true;
}
