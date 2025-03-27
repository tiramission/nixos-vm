{
  lib,
  params,
  mlib,
  ...
}: {
  imports = [
    ./modules/fish-in-bash.nix
    ./modules/fix-vscode-ld.nix
  ];
  mtool.fish-in-bash.enable = true;
  mtool.fix-vscode-ld.enable = params.wsl;
}
