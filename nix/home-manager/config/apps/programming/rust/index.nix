{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    libllvm
    # TODO: Find a way for libraries that tauri needs

    # rustc
    # rustup
    # cargo # Part of rustup
    # rustfmt # Part of rustup
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
