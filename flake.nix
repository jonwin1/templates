{
  description = "My Nix templates";

  outputs =
    { self }:
    {
      templates = {
        c = {
          path = ./c;
          description = "C template";
        };
        go = {
          path = ./go;
          description = "Go template";
        };
        go-package = {
          path = ./go-package;
          description = "Go package template";
        };
        java = {
          path = ./java;
          description = "Java and maven shell env";
        };
        jupyter = {
          path = ./jupyter;
          description = "Jupyter template";
        };
        latex = {
          path = ./latex;
          description = "Latex template";
        };
        pip = {
          path = ./pip;
          description = "Python pip template";
        };
        python = {
          path = ./python;
          description = "Python template";
        };
        zig = {
          path = ./zig;
          description = "Zig template";
        };
      };
    };
}
