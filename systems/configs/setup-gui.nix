{...}: {
  imports = [
    ../desktop/setup-gnome.nix
    # ../desktop/setup-xrdp.nix (use gnome remote)
    ../desktop/setup-ime.nix
    ../desktop/setup-font.nix
  ];
}
