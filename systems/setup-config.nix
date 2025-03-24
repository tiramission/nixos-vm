# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  lib,
  params,
  ...
}: let
in {
  imports = lib.concatLists [
    (lib.optionals true [./configs/setup-common.nix])
    (lib.optionals (params.gui) [./configs/setup-gui.nix])
    (lib.optionals (params.machine != "wsl") [./configs/setup-nowsl.nix])
    (lib.optionals true [./configs/setup-hardware.nix])
  ];
}
