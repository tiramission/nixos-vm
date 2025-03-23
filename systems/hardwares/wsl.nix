{inputs, ...}: {
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];
  wsl.enable = true;
  wsl.defaultUser = "jaign";
  wsl.useWindowsDriver = true;
  wsl.wslConf.interop.appendWindowsPath = false;
}
