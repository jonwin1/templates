{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    texliveFull
    texlab                     # LSP
    python313Packages.pygments # Required by minted
  ];
}
