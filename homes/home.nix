{
  lib,
  inputs,
  pkgs,
  params,
  ...
}: {
  imports = lib.concatLists [
    (lib.optionals true [./setups/pkgs.nix])
    (lib.optionals true [./setups/apps.nix])
    (lib.optionals (params.machine != "wsl") [./tools/fix-vscode.nix])
  ];

  home.stateVersion = "24.11";
}
