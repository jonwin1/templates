{
  description = "My Nix flake templates";

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
      };
    };
}
