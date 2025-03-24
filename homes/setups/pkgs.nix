{
  pkgs,
  params,
  lib,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./pkgs/cmd.nix] true)
    (mlib.includeif [./pkgs/gui.nix] params.gui)
  ];
}
