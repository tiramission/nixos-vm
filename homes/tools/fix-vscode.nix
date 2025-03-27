# This is a fix for vscode-server to work with notWSL
{inputs, ...}: {
  imports = [
    inputs.vscode-server.homeModules.default
  ];
  services.vscode-server.enable = true;
}
