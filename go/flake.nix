{
  description = ""; # TODO: Add description

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

      # Build-time dependencies
      nativeBuildInputs = forAllSystems (
        pkgs: with pkgs; [
          go
          gopls
        ]
      );

      # Run-time dependencies
      buildInputs = forAllSystems (
        pkgs: with pkgs; [
        ]
      );
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.buildGoModule {
          pname = ""; # TODO: Package name
          src = ./.;

          inherit nativeBuildInputs buildInputs;

          # Hash of the dependencies
          vendorHash = pkgs.lib.fakeHash;
        };
      });

      devShells.default = forAllSystems (
        pkgs:
        pkgs.mkShell {
          inherit nativeBuildInputs buildInputs;
        }
      );
    };
}
