# This is a fix for vscode-server to work with WSL
{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
