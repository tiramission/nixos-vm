# This is a fix for vscode-server to work with notWSL
{
  inputs,
  lib,
  params,
  ...
}:
lib.optionalAttrs (params.machine != "wsl")
{
  imports = [
    inputs.vscode-server.homeModules.default
  ];
  services.vscode-server.enable = true;
}
