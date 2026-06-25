{
  pkgs ? import <nixpkgs> { },
}:

let
  python = pkgs.python313;

  pythonEnv = python.withPackages (
    ps: with ps; [
      pip
      virtualenv
    ]
  );
in
pkgs.mkShell {
  name = "pip";

  buildInputs = [
    pythonEnv
  ];

  shellHook = ''
    if [ ! -d .venv ]; then
      python -m venv .venv
    fi

    source .venv/bin/activate

    echo "Install packages with:"
    echo "  pip install --upgrade pip"
    echo "  pip install ..."
  '';
}
