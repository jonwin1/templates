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
        latex = {
          path = ./latex;
          description = "Latex template";
        };
        python = {
          path = ./python;
          description = "Python template";
        };
        jupyter = {
          path = ./jupyter;
          description = "Jupyter template";
        };
      };
    };
}
