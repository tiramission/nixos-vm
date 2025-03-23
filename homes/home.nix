{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./setups/nix-index.nix

    ./setups/pkgs.nix
    ./setups/apps.nix

    ./setups/shell.nix

    ./tools/fix-vscode.nix
  ];

  home.stateVersion = "24.11";
}
