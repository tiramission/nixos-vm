# This is a fix for vscode-server to work with notWSL
{
  inputs,
  lib,
  params,
  ...
}: {
  imports = [
    inputs.vscode-server.homeModules.default
  ];
  services.vscode-server.enable = true;
}
