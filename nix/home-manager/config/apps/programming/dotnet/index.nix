{ config, pkgs, inputs, system, nurpkgs, ... }:

{
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # mono
    # dotnet-sdk_8
    # dotnet-runtime_8 # Part of SDK
    # dotnet-aspnetcore_8 # Part of SDK
    # dotnetPackages.Nuget
    # dotnetPackages.MonoAddins
    # dotnetPackages.NewtonsoftJson
    # dotnetPackages.NUnit
    # dotnetPackages.NUnitConsole
    # dotnetPackages.NUnitRunners
    # dotnetPackages.Paket
    icu
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
