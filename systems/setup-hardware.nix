{
  inputs,
  params,
  ...
}: let
  disko-imports = [
    inputs.disko.nixosModules.disko
    ./disks/ext4.nix
  ];
in {
  imports =
    [
      ./hardwares/${params.machine}.nix
    ]
    ++ (
      if params.machine != "wsl"
      then disko-imports
      else []
    );
}
