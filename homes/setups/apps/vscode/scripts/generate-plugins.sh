#!/usr/bin/env bash

nix run "github:nix-community/nix4vscode" -- config.toml --output ../plugins.nix

