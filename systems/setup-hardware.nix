{params, ...}: let
in {
  imports = [
    ./hardwares/${params.machine}.nix
    ./hardwares/disko.nix
  ];
}
