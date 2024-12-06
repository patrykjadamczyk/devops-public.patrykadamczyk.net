{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    sqlite
    dive
    gettext
    #moncho/dry # not on nix
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
