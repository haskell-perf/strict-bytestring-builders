{
  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    #flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };
  outputs = inputs@{ nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.haskell-flake.flakeModule ];
      perSystem = { self', pkgs, ... }: {
        haskellProjects.default = {
          packages = {
            bytestring-builders-benchmark.root = ./.;
          };
          haskellPackages = pkgs.haskell.packages.ghc944;
          # nix hls, ghcid breaks on 9.4
          buildTools = _: { haskell-language-server = null; ghcid = null; hlint = null; };
          overrides = self: super: {
            mason = super.mason_0_2_6;
            flatparse = self.callCabal2nix "flatparse" (pkgs.fetchFromGitHub {
              owner = "AndrasKovacs";
              repo = "flatparse";
              rev = "d96616b7abdf78f064f775c47d218c4721daa38c";
              sha256 = "eO4L+QTsn+HbawjJO2j/EJag62OKMH/PzbcyZJKEbu0=";
            }) {};
          };
        };
      };
    };
}
