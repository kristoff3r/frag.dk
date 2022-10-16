{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      # Basic libs
      pkgs = import nixpkgs {
        inherit system;
      };
      lib = pkgs.lib;
    in
    {
      packages = { };

      devShells = {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            zola
          ];
        };
      };
    }
  );
}
