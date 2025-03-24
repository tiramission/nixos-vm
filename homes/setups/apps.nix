{pkgs, ...}: {
  imports = [
    ./apps/vscode.nix
    ./apps/git.nix
    ./apps/nix-index.nix
    ./apps/fish.nix
  ];
}
