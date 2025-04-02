{
  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "x86_64-darwin"
          "aarch64-linux"
          "aarch64-darwin"
        ] (system: function { pkgs = import nixpkgs { inherit system; }; });

    in
    {
      packages = forAllSystems (
        { pkgs }:
        {
          default = pkgs.stdenv.mkDerivation {
            name = "main";
            src = ./.;

            buildInputs = with pkgs; [
              texliveFull
            ];

            buildPhase = ''
              mkdir -p .cache/latex
              latexmk -auxdir=.cache/latex -pdf main.tex
            '';

            installPhase = ''
              mkdir -p $out/bin
              cp main.pdf $out/bin
            '';
          };
        }
      );

      devShells = forAllSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              texliveFull
              texlab
            ];
          };
        }
      );
    };
}
