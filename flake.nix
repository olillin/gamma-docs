{
  description = "Development shell for gamma-docs with formatters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    {
      overlays.default = final: prev: {
        python313 = prev.python313.override {
          packageOverrides = pyFinal: pyPrev: {
            mdformat-config = pyFinal.callPackage (
              {
                fetchurl,
                buildPythonPackage,
                mdformat,
                ruamel-yaml,
                taplo,
              }:
                buildPythonPackage {
                  pname = "mdformat-config";
                  version = "0.2.1";
                  src = fetchurl {
                    url = "https://files.pythonhosted.org/packages/4e/73/e989491953da2cb446253258d0f3694ea021c277ca0cfbefe0a79ca5eef1/mdformat_config-0.2.1-py3-none-any.whl";
                    sha256 = "0bghan0frq7g3d49xd8d950h3j4ji9ny74abkrfghrkk0ry8cjj8";
                  };
                  format = "wheel";
                  doCheck = false;
                  propagatedBuildInputs = [
                    mdformat
                    ruamel-yaml
                    taplo
                  ];
                }
            ) {};
          };
        };
      };
    }
    // (flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [self.overlays.default];
      };
      inherit (pkgs) lib;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs;
          [
            alejandra
          ]
          ++ (with python313Packages; [
            # MdFormat with extensions
            mdformat
            mdformat-mkdocs
            mdformat-config
            mdformat-footnote
            mdformat-tables

            # MkDocs with extensions
            mkdocs
            mkdocs-glightbox
            mkdocs-material
            neoteroi-mkdocs
            pymdown-extensions
          ]);

        shellHook = ''
          export NIXSHELL="$NIXSHELL+gamma-docs"
        '';
      };
    }));
}
