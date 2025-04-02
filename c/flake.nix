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
          # Hint: use `nix-locate foo.h` to find package providing that header.
        ];

        # Build-time dependencies
        nativeBuildInputs = with pkgs; [
          clang-tools
          valgrind
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
          default = pkgs.stdenv.mkDerivation {
            name = "main";
            src = ./.;

            buildInputs = deps.buildInputs;
            nativeBuildInputs = deps.nativeBuildInputs;

            buildPhase = "make";
            installPhase = ''
              mkdir -p $out/bin
              cp $name $out/bin
            '';
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
