{
  lib,
  params,
  ...
}: let
in {
  imports = lib.concatLists [
    (lib.optionals true [../hardwares/${params.machine}.nix])
    (lib.optionals (params.machine != "wsl") [../hardwares/disko.nix])
  ];
}
