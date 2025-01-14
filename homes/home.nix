{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./setups/nix-index.nix
    ./setups/pkgs.nix
    ./setups/apps.nix
    ./setups/git.nix
    ./setups/shell.nix
  ];

  home.stateVersion = "24.11";
}
