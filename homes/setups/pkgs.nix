{pkgs, params, ...}: {
  home.packages = with pkgs; [
    grc # fish

    # command
    bat
    tree;

    # gui
    ] ++ (if params.gui then [
      zed-editor
      warp-terminal
      ghostty
    ] else []);
}
