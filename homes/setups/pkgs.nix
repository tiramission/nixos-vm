{
  pkgs,
  params,
  lib,
  ...
}: {
  imports = lib.concatLists [
    (lib.optionals true [./pkgs/cmd.nix])
    (lib.optionals (params.gui) [./pkgs/gui.nix])
  ];
}
