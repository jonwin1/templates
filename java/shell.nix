{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    jdk
    maven
  ];

  shellHook = ''
    echo "Initialize a project:"
    echo "    mvn archetype:generate"
  '';
}
