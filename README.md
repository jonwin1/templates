# Project templates

My collection of project and dev-shell templates for nix.

## Usage

Replace `<template>` with the template name.
```sh
mkdir project && cd project
nix flake init -t github:jonwin1/templates#<template>
```

To locally ignore the files in a git project where you do not want to push any
nix files of .gitignore changes add the files to .git/info/exclude. This works
just like a .gitignore file but only exists locally.
