{
  lib,
  params,
  ...
}: {
  imports = lib.optionals params.gui [
    ./desktop/setup-gnome.nix
    ./desktop/setup-xrdp.nix
    ./desktop/setup-ime.nix
  ];
}
