{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    press.url = "github:RossSmyth/press";

    font-awesome-icons = {
      url = "github:FortAwesome/Font-Awesome";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      press,
      font-awesome-icons,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;

      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          overlays = [
            press.overlays.default
            self.overlays.default
          ];
        }
      );
    in
    {
      overlays.default = final: _prev: {
        diogo-correia-cv = final.callPackage ./package.nix { };
        font-awesome-icons = font-awesome-icons;
        font-awesome-typst = final.callPackage ./font-awesome-typst { };
        get-projects-metadata = final.writeShellApplication {
          name = "get-projects-metadata";
          runtimeInputs = [
            final.curl
            final.jq
          ];
          text = builtins.readFile ./scripts/get-projects-metadata.sh;
        };
      };

      checks = forAllSystems (system: {
        test-cv-builds = self.packages.${system}.default;
      });

      packages = forAllSystems (system: {
        default = nixpkgsFor.${system}.diogo-correia-cv;
      });

      apps = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
          cv = pkgs.diogo-correia-cv;

          output = "diogo-correia-cv.pdf";

          mkApp =
            {
              name,
              text,
              runtimeInputs ? [ ],
            }:
            {
              type = "app";
              program = lib.getExe (pkgs.writeShellApplication { inherit name runtimeInputs text; });
            };
        in
        rec {
          default = dev;

          dev = mkApp {
            name = "dev";
            runtimeInputs = [ cv.typst-wrapped ];
            text = ''
              exec typst watch main.typ ${output}
            '';
          };

          build = mkApp {
            name = "build";
            text = ''
              install -m644 ${cv} ${output}
            '';
          };

          gen = mkApp {
            name = "gen";
            runtimeInputs = [ pkgs.get-projects-metadata ];
            text = ''
              get-projects-metadata template/gh-metadata \
                wavecomtech/omlox-client-go \
                NixOS/nixpkgs
            '';
          };
        }
      );

      formatter = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        pkgs.nixfmt-tree.override {
          runtimeInputs = [ pkgs.typstyle ];
          settings.formatter.typstyle = {
            command = "typstyle";
            options = [ "-i" ];
            includes = [ "*.typ" ];
          };
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShellNoCC {
            inputsFrom = [ pkgs.diogo-correia-cv ];
            packages = [
              pkgs.tinymist
              pkgs.typstyle
            ];
          };
        }
      );
    };
}
