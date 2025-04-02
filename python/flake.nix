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
          python3Full
          python313Packages.jedi-language-server
        ];
      };
    in
    {
      # packages = forAllSystems (
      #   pkgs:
      #   let
      #     deps = commonDeps pkgs;
      #   in
      #   {
      #     default = pkgs.stdenv.mkDerivation {
      #       name = "main";
      #       src = ./.;
      #
      #       buildInputs = deps.buildInputs;
      #       nativeBuildInputs = deps.nativeBuildInputs;
      #
      #       buildPhase = "";
      #       installPhase = ''
      #         mkdir -p $out/bin
      #         cp $name $out/bin
      #       '';
      #     };
      #   }
      # );

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
