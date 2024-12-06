{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    luajit
    luajitPackages.luarocks
    luajitPackages.luv
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
