{
  pkgs,
  lib,
  mlib,
  params,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./apps/vscode] params.gui)
    (mlib.includeif [./apps/git.nix] true)
    (mlib.includeif [./apps/nix-index.nix] true)
    (mlib.includeif [./apps/fish.nix] true)
    (mlib.includeif [./apps/zsh.nix] true)
    (mlib.includeif [./apps/go.nix] true)
  ];
}
