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
        ] (system: function nixpkgs.legacyPackages.${system});

    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.callPackage ./package.nix { };
      });

      devShells = forAllSystems (
        pkgs:
        pkgs.mkShell {
          buildInputs = with pkgs; [
            texliveFull
            texlab
          ];
        }
      );
    };
}
