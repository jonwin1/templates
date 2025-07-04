{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    clang-tools
    gnumake
    valgrind

    man-pages
    man-pages-posix
  ];

  shellHook = ''
    echo "Entered C dev shell."
    echo "Run 'make' to build the project."
  '';
}
