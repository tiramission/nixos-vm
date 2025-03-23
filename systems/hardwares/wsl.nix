{
  inputs,
  params,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];
  wsl.enable = true;
  wsl.defaultUser = params.username;
  wsl.useWindowsDriver = true;
  wsl.wslConf.interop.appendWindowsPath = false;
}
