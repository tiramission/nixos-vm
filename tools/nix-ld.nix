# This is a fix for vscode-server to work with notWSL
{
  pkgs,
  lib,
  params,
  ...
}:
lib.optionalAttrs (params.machine == "wsl")
{
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
