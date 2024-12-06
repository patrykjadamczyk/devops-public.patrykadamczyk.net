{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # nodenv
    # nodejs
    # nodejs_latest
    # nodePackages_latest.node-gyp
    # nodePackages_latest.node-pre-gyp
    # nodePackages_latest.node-gyp-build
    # nodePackages_latest.neovim
    # nodePackages_latest.jsonlint
    # nodePackages_latest.npm # Part of nodejs_latest itself
    # nodePackages_latest.yarn
    # nodePackages_latest.pnpm
    # bun
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
