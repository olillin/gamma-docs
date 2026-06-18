# Contributing

Thank you for your interest in contributing to the Gamma documentation!

Contributions to this document are welcome and much appreciated. Contact Cal or
digIT to find out how you can help.

## Prerequisites

This project uses these tools:

- [Nix Flakes](https://nixos.org)
- [MkDocs](https://www.mkdocs.org) with extensions
- [mdformat](https://mdformat.readthedocs.io)
- [yamlfmt](https://github.com/google/yamlfmt)
- [Taplo](https://taplo.tamasfe.dev)
- [Alejandra](https://github.com/kamadorueda/alejandra)

Use Nix to start the development shell with these included by running:

```console
nix develop
```

## Previewing the documentation

To host a preview locally with MkDocs run this command in the project root:

```console
mkdocs serve
```

The documentation should be available at <http://127.0.0.1:8000>, changes to the
document will be reflected automatically as you edit.

## Formatting

This project uses various formatters to keep all files looking nice and
consistent. Always format before committing.

### Format Everything

The Nix flake includes a `fmt` command which runs all the formatters:

```console
fmt
```

### Markdown

Run this command to format Markdown files with **mdformat**:

```console
mdformat .
```

### YAML

Run this command to format YAML files with **yamlfmt**:

```console
yamlfmt .
```

### TOML

Run this command to format TOML files with **Taplo**:

```console
taplo fmt
```

### Nix

Run this command to format Nix files with **Alejandra**:

```console
alejandra .
```
