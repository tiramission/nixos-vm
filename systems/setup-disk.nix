# USAGE in your configuration.nix.
# Update devices to match your hardware.
{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk.nix
  ];
}
