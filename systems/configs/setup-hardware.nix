{
  lib,
  params,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [../hardwares/${params.machine}.nix] (!params.wsl))
    (mlib.includeif [../hardwares/wsl.nix] params.wsl)
    (mlib.includeif [../disks/disko.nix] (!params.wsl))
  ];
}
