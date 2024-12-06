{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # Version Control
    gitFull
    mercurial
    delta
    lazygit
    tig
    #git-cola
    gitoxide
    gittyup
    got
    jujutsu
    sapling
    peru
    pijul
    rcs
    verco
    gut
    git-subrepo
    # GitHub CLI
    gh
    hub
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
  fonts.fontconfig.enable = true;
}
