{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./setups/nix-index.nix
    ./setups/git.nix
    ./setups/shell.nix
  ];

  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    grc

    bat
  ];
}
