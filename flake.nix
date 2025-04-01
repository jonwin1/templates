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
        latex = {
          path = ./latex;
          description = "Latex template";
        };
        go = {
          path = ./go;
          description = "Go template";
        };
      };
    };
}
