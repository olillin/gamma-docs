{
  description = "Development shell for gamma-docs with formatters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      inherit (pkgs) lib;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          mdformat
          alejandra
        ];

        shellHook = ''
          export NIXSHELL="$NIXSHELL+gamma-docs"
        '';
      };
    });
}
