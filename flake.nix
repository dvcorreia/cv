{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    font-awesome = {
      url = "github:FortAwesome/Font-Awesome";
      flake = false;
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      typix,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) lib;

        typixLib = typix.lib.${system};

        src = typixLib.cleanTypstSource ./.;
        commonArgs = {
          typstSource = "main.typ";

          fontPaths = [
            # Add paths to fonts here
            "${pkgs.roboto-slab}/share/fonts/truetype"
            "${pkgs.lato}/share/fonts/lato"
          ];

          virtualPaths = [
            # Add paths that must be locally accessible to typst here
            {
              dest = "template/vendor/icons";
              src = "${inputs.font-awesome}/svgs";
            }
            {
              dest = "template/gh-metadata";
              src = ./template/gh-metadata;
            }
            {
              dest = "photos";
              src = ./photos;
            }
          ];
        };

        # Compile a Typst project, *without* copying the result
        # to the current directory
        build-drv = typixLib.buildTypstProject (commonArgs // { inherit src; });

        # Compile a Typst project, and then copy the result
        # to the current directory
        build-script = typixLib.buildTypstProjectLocal (commonArgs // { inherit src; });

        # Watch a project and recompile on changes
        watch-script = typixLib.watchTypstProject commonArgs;

        # Fetch json metadata for the GitHub projects
        gen-script =
          { repos }:
          pkgs.writeShellApplication {
            name = "update-projects-metadata-script";
            runtimeInputs = [ pkgs.curl ];
            text = ''
              mkdir -p template/gh-metadata
              repos=(${builtins.concatStringsSep " " (map (r: "${r.owner}/${r.repo}") repos)})
              for repo in "''${repos[@]}"; do
                IFS=/ read -r owner name <<< "$repo"
                curl -H "Accept: application/vnd.github+json" \
                  "https://api.github.com/repos/$owner/$name" | \
                  jq '.' > template/gh-metadata/"$owner""_""$name.json"
              done
            '';
          };

        format-script = pkgs.writeShellApplication {
          name = "format-script";
          runtimeInputs = [ pkgs.typstyle ];
          text = ''
            typstyle -i ./**/*.typ
          '';
        };
      in
      {
        checks = {
          inherit build-drv build-script watch-script;
        };

        packages.default = build-drv;

        apps = rec {
          default = watch;
          build = flake-utils.lib.mkApp { drv = build-script; };
          watch = flake-utils.lib.mkApp { drv = watch-script; };
          gen = flake-utils.lib.mkApp {
            drv = gen-script {
              repos = [
                {
                  owner = "wavecomtech";
                  repo = "omlox-client-go";
                }
                {
                  owner = "NixOS";
                  repo = "nixpkgs";
                }
              ];
            };
          };
          format = flake-utils.lib.mkApp { drv = format-script; };
        };

        devShells.default = typixLib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          packages = [
            # WARNING: Don't run `typst-build` directly, instead use `nix run .#build`
            # See https://github.com/loqusion/typix/issues/2
            # build-script
            watch-script

            pkgs.typstyle
          ];
        };
      }
    );
}
