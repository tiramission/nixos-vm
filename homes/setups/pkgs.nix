{
  pkgs,
  params,
  ...
}: let
  gui-pkgs = with pkgs; [
    zed-editor
    warp-terminal
    ghostty
  ];
in {
  home.packages = with pkgs;
    [
      grc # fish

      # command
      bat
      tree
    ]
    ++ (
      if params.gui
      then gui-pkgs
      else []
    );
}
