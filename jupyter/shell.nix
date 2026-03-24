{
  pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  },
}:

let
  python = pkgs.python312;

  pythonEnv = python.withPackages (
    ps: with ps; [
      pip
      virtualenv
    ]
  );
in
pkgs.mkShell {
  name = "jupyter-tensorflow-cuda";

  buildInputs = [
    pythonEnv

    pkgs.cudaPackages.cudatoolkit
    pkgs.cudaPackages.cudnn

    pkgs.linuxPackages.nvidia_x11
    pkgs.stdenv.cc.cc.lib
  ];

  shellHook = ''
    export CUDA_PATH=${pkgs.cudaPackages.cudatoolkit}
    export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.linuxPackages.nvidia_x11}/lib:${pkgs.cudaPackages.cudatoolkit.lib}:${pkgs.cudaPackages.cudnn}/lib:$LD_LIBRARY_PATH

    if [ ! -d .venv ]; then
      python -m venv .venv
    fi

    source .venv/bin/activate

    echo "Install python packages:"
    echo "  pip install --upgrade pip"
    echo "  pip install jupyterlab ipykernel numpy pandas seaborn matplotlib scipy scikit-learn 'tensorflow[and-cuda]' tensorflow-decision-forests"
    echo "Add venv kernel:"
    echo "  python -m ipykernel install --user --name venv"
  '';
}
