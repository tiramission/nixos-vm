{
  inputs,
  lib,
  params,
  ...
}: let
in {
  imports = [
    inputs.disko.nixosModules.disko
    ../disks/ext4.nix
  ];
}
