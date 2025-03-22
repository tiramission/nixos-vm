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
  ed25519-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhmSdP4sVoCQy7I72E4LBg77WA0dZYeUQHNOlNnD0M6";
  binary-mirror = "https://mirrors.ustc.edu.cn/nix-channels/store";
in {
  imports = [
    ./setup-hardware.nix
    ./setup-disk.nix
  ] ++ if params.gui then [
    ./setup-fonts.nix
    ./setup-desktop.nix
  ] else [];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = [binary-mirror];
  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    alejandra
  ];
  environment.variables.EDITOR = "nvim";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 5;

  users.users.jaign = {
    isNormalUser = true;
    description = "jaign";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [ed25519-key];
    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
    hashedPassword = "$y$j9T$YL92Oi1f0ZSAE9Zcyj5M5/$Ktasy.qAJvFc8DZHKBLz9dq1kk0vA87opaJ8ckaObm.";
  };
  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "yes";
    PasswordAuthentication = false;
  };
  users.users."root".openssh.authorizedKeys.keys = [
    ed25519-key
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true;
}
