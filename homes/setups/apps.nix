{
  pkgs,
  lib,
  mlib,
  params,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./apps/vscode.nix] params.gui)
    (mlib.includeif [./apps/git.nix] true)
    (mlib.includeif [./apps/nix-index.nix] true)
    (mlib.includeif [./apps/fish.nix] true)
  ];
}
