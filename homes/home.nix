{
  lib,
  mlib,
  inputs,
  pkgs,
  params,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./setups/pkgs.nix] true)
    (mlib.includeif [./setups/apps.nix] true)
    (mlib.includeif [./tools/fix-vscode.nix] (!params.wsl))
  ];

  home.stateVersion = "25.05";
}
