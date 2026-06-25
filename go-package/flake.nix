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
        ] (system: function { pkgs = import nixpkgs { inherit system; }; });

      commonDeps = pkgs: {
        # Run-time dependencies
        buildInputs = with pkgs; [
        ];

        # Build-time dependencies
        nativeBuildInputs = with pkgs; [
          go
          gopls
        ];
      };
    in
    {
      packages = forAllSystems (
        { pkgs }:
        let
          deps = commonDeps pkgs;
        in
        {
          default = pkgs.buildGoModule {
            name = "main";
            src = ./.;

            buildInputs = deps.buildInputs;
            nativeBuildInputs = deps.nativeBuildInputs;

            # Hash of the dependencies
            vendorHash = null;
          };
        }
      );

      devShells = forAllSystems (
        { pkgs }:
        let
          deps = commonDeps pkgs;
        in
        {
          default = pkgs.mkShell {
            buildInputs = deps.buildInputs;
            nativeBuildInputs = deps.nativeBuildInputs;
          };
        }
      );
    };
}
