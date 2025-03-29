{
  description = "My Nix flake templates";

  outputs =
    { self }:
    {
      templates = {
        go = {
          path = ./go;
          description = "Go template";
        };
      };
    };
}
