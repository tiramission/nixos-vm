{
  config,
  params,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (params.machine == "wsl") {
    wsl.enable = true;
    wsl.defaultUser = "jaign";
    wsl.useWindowsDriver = true;
    wsl.wslConf.interop.appendWindowsPath = false;
  };
}
