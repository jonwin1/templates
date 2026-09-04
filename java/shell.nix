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
    echo "Execute:"
    echo "    mvn compile exec:java -Dexec.mainClass=\"package.main.Class\""
  '';
}
