# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  params,
  ...
}: let
  binary-mirror = "https://mirrors.ustc.edu.cn/nix-channels/store";
  gui-imports = [
    ./setup-fonts.nix
    ./setup-desktop.nix
  ];
in {
  imports =
    [
      ./setup-hardware.nix
      ./configs/setup-wsl.nix
      ./configs/setup-nowsl.nix
    ]
    ++ (
      if params.gui
      then gui-imports
      else []
    );

  networking.hostName = params.hostname;
  networking.proxy.default = params.proxy;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = [binary-mirror];
  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    alejandra
  ];
  environment.variables.EDITOR = "nvim";
  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "24.11"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true;
}
