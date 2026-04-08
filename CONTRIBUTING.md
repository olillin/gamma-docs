# Contributing

Thank you for your interest in contributing to the Gamma documentation!

Contributions to this document are welcome and much appreciated. Contact Cal or
digIT to find out how you can help.

## Formatting

This project uses various formatters to keep all files looking nice and
consistent.

If using Nix you can start the development shell including these with:

```console
nix develop
```

### Format Everything

The flake includes a `fmt` command which runs all the formatters:

```console
fmt
```

### Markdown

Run this command to format Markdown files with
[mdformat](https://mdformat.rtfd.io):

```console
mdformat .
```

### YAML

Run this command to format YAML files with
[yamlfmt](https://github.com/google/yamlfmt):

```console
yamlfmt .
```

### TOML

Run this command to format TOML files with [Taplo](https://taplo.tamasfe.dev):

```console
taplo fmt
```

### Nix

Run this command to format Nix files with
[Alejandra](https://github.com/kamadorueda/alejandra):

```console
alejandra .
```
