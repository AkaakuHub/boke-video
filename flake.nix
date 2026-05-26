{
  description = "Boke Video";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Go
            go_1_25

            # Node.js and pnpm
            nodejs_22
            pnpm_10

            # Development tools
            curl
            lsof
            perl
            git

            # Required for local media engine (Docker)
            docker
          ];
        };
      }
    );
}
