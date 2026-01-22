{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        jupyterlab
        ipykernel

        scikit-learn
        pandas
        scipy
        numpy
        matplotlib
        tensorflow
      ]
    ))
  ];
}
