{
  description = "Development environment with Python, gnuplot, graphviz, and specific Python packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Override graphviz to specify a particular version, for example, 2.49.0
      #graphvizVersioned = pkgs.graphviz.overrideAttrs (oldAttrs: {
      #  version = "2.49.0";
      #  src = pkgs.fetchurl {
      #    url = "https://gitlab.com/graphviz/graphviz/-/archive/2.49.0/graphviz-2.49.0.tar.gz";
      #    # sha256 = "1nk28cd0yz0g0xx6m3mz0py40rsdkk9c5s9p7fbmpyg9hv8yz4gm";
      #  };
      #});
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = with pkgs; [
            (python312.withPackages(ps: with ps; [
              scipy
              # (ps.scipy.override { version = "1.9.3"; })
            ]))
            # neovim
            gnuplot
            # graphvizVersioned
          ];

          shellHook = ''
            echo "entering dev environment"
          '';
        };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
