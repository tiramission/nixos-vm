{pkgs, ...}: {
  imports = [
    ./apps/vscode.nix
    ./apps/git.nix
  ];

  home.packages = with pkgs; [
  ];
}
