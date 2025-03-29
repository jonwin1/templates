# Project templates

My collection of templates using nix flakes.

## Usage

Replace `<template>` with the template name.
```sh
mkdir project && cd project
nix flake init -t github:jonwin1/templates#<template>
```

If the flake doesn't use flakes just copy the contents of the directory instead.
