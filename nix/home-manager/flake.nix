{
  description = "Home Manager configuration of patryk";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Added source for NUR
    nur = {
        url = "github:nix-community/NUR";
    };
    # Added source for nix-software-center
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    # Added source for nixos-conf-editor
    # nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    # Added source for neovim-nightly
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # Slow Ring
    nixpkgs_slow_ring.url = "github:nixos/nixpkgs/7dcb6cdbc4a52767a5fd70d0f57562e7667e3d36";
    # Slowest Ring
    nixpkgs_slowest_ring.url = "github:nixos/nixpkgs/7dcb6cdbc4a52767a5fd70d0f57562e7667e3d36";
  };

  outputs = { nixpkgs, home-manager, nur, nixpkgs_slowest_ring, nixpkgs_slow_ring, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nurpkgs = import nur {
        nurpkgs = import nixpkgs { system = system; };
        pkgs = import nixpkgs { system = system; };
      };
      pkgs_slowest_ring = nixpkgs_slowest_ring.legacyPackages.${system};
      pkgs_slow_ring = nixpkgs_slow_ring.legacyPackages.${system};
    in {
      homeConfigurations."patryk" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          ./config/fonts.nix
          ./config/apps/shell.nix
          ./config/apps/shell-utils.nix
          ./config/apps/source_control.nix
          ./config/apps/editor.nix
          ./config/apps/programming/general.nix
          ./config/apps/programming/cpp/index.nix
          ./config/apps/programming/dotnet/index.nix
          ./config/apps/programming/go/index.nix
          ./config/apps/programming/javascript/index.nix
          ./config/apps/programming/lua/index.nix
          ./config/apps/programming/nim/index.nix
          ./config/apps/programming/php/index.nix
          ./config/apps/programming/python3/index.nix
          ./config/apps/programming/rust/index.nix
          ./config/apps/programming/tex/index.nix
          ./config/apps/ui.nix
          ./nur.nix
          ./unfree.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit system;
          inherit nurpkgs;
          inherit pkgs_slowest_ring;
          inherit pkgs_slow_ring;
        };

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
