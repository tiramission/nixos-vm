# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  lib,
  params,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./configs/setup-common.nix] true)
    (mlib.includeif [./configs/setup-gui.nix] params.gui)
    (mlib.includeif [./configs/setup-nowsl.nix] (!params.wsl))
    (mlib.includeif [./configs/setup-hardware.nix] true)
    (mlib.includeif [./configs/setup-overlays.nix] true)
    (mlib.includeif [./configs/setup-docker.nix] params.docker)
    (mlib.includeif [./configs/setup-incus.nix] params.incus)
  ];
}
