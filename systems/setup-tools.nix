{
  lib,
  params,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif [./tools/fish-in-bash.nix] true)
    (mlib.includeif [./tools/fix-vscode-ld.nix] (params.machine == "wsl"))
  ];
}
