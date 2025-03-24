{
  inputs,
  lib,
  params,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ../disks/ext4.nix
  ];
}
