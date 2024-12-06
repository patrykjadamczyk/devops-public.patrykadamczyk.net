let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
    pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
    packages = with pkgs; [
        # git
    ];

    # GIT_EDITOR = "${pkgs.neovim}/bin/nvim";

    shellHook = ''
        echo "SHELL"
    '';
}
