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
    (mlib.includeif [./tools/fix-vscode.nix] (params.machine != "wsl"))
  ];

  home.stateVersion = "24.11";
}
