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
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.buildGoModule {
          pname = ""; # TODO: Package name
          version = self.shortRev or self.dirtyShortRev;
          src = ./.;
          nativeBuildInputs = with pkgs; [ ]; # TODO: Build-time dependencies
          buildInputs = with pkgs; [ ]; # TODO: Run-time dependencies
          vendorHash = pkgs.lib.fakeHash;
          # vendorHash = ""; # TODO: Set vendor hash
        };
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            go-tools
            gotools

            # TODO: Development dependencies
          ];
        };
      });
    };
}
