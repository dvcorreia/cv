{
  description = "My CV based on Alta template by LianTze Lim";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        buildDeps = with pkgs; [ git gnumake texliveFull ];
        devDeps = with pkgs;
          buildDeps ++ [
          ];
      in
      { devShell = pkgs.mkShell { buildInputs = devDeps; }; }
    );

}
