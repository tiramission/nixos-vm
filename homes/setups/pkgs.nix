{pkgs, ...}: {
  home.packages = with pkgs; [
    grc # fish

    # command
    bat
    tree

    # gui
    zed-editor
    warp-terminal
    ghostty
  ];
}
