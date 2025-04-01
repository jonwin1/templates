{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "pdf";
  src = ./.;

  buildInputs = with pkgs; [
    texliveFull
  ];

  buildPhase = ''
    mkdir -p .cache/latex
    latexmk -interaction=nonstopmode -auxdir=.cache/latex -pdf main.tex
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp main.pdf $out/bin
  '';
}
