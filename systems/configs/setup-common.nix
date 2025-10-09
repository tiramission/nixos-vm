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
  binary-mirrors = [
    "http://192.168.30.10:8080/default"
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];
in {
  networking.hostName = params.hostname;
  networking.proxy.default = params.proxy;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = binary-mirrors;
  nix.settings.trusted-public-keys = [
    "default:9wMBoTJQmVcz+2YMmyx611BWkJj6KlHZsW8Wv4RXIhg="
  ];
  nix.settings.use-xdg-base-directories = true;

  nix.package = pkgs.unstable.nixVersions.latest;

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    alejandra
  ];
  environment.variables.EDITOR = "nvim";
  security.sudo.wheelNeedsPassword = false;

  i18n.defaultLocale = "zh_CN.UTF-8";

  system.stateVersion = "25.05"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true;
}
