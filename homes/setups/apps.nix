{pkgs, ...}: {
  imports = [
    ./apps/vscode.nix
  ];

  home.packages = with pkgs; [
    firefox
  ];
}
