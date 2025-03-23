{pkgs, ...}: {
  home.packages = with pkgs; [
    zed-editor
    warp-terminal
    ghostty
    firefox
  ];
}
