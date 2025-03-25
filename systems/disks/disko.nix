{
  inputs,
  lib,
  params,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./ext4.nix
  ];
}
