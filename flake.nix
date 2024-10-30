{
  description = "Development environment with Python, gnuplot, graphviz, and specific Python packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = with pkgs; [
            (python312.withPackages(ps: with ps; [
              scipy
            ]))
            emacs
            gnuplot
            graphviz
          ];

          shellHook = ''
            echo "entering dev environment"
          '';
        };
  };
}
