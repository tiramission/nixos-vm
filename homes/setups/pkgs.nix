{
  pkgs,
  params,
  lib,
  ...
}: {
  imports = lib.optionals params.gui [
    ./pkgs/gui.nix
  ];

  home.packages = with pkgs; [
    grc # fish

    # command
    bat
    tree
  ];
}
