{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "Iosevka"
      "IosevkaTerm"
      "IosevkaTermSlab"
      "JetBrainsMono"
      "CascadiaCode"
      "CommitMono"
      "DaddyTimeMono"
      "FiraCode"
      "FiraMono"
      "Gohu"
      "Go-Mono"
      "Meslo"
      "Monaspace"
      "Noto"
      "ProFont"
      "RobotoMono"
      "SourceCodePro"
      "SpaceMono"
      "NerdFontsSymbolsOnly"
      "Ubuntu"
      "UbuntuMono"
      "VictorMono"
      "OpenDyslexic"
      # "BlexMono"
      "IBMPlexMono"
      "Inconsolata"
      "InconsolataGo"
      "InconsolataLGC"
      "MartianMono"
      "Monofur"
      "Monoid"
      "Mononoki"
      "Overpass"
      "ProggyClean"
      # "RecMono"
      "Recursive"
      # "Terminess"
      "Terminus"
      "ZedMono"
    ]; })
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
