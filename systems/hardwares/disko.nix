{
  inputs,
  lib,
  params,
  ...
}: let
in {
  imports = lib.optionals (params.machine != "wsl") [
    inputs.disko.nixosModules.disko
    ../disks/ext4.nix
  ];
}
