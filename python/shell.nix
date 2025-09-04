{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    python3Full
    python313Packages.numpy
    jdk24
  ];
}
