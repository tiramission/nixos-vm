{
  config,
  params,
  lib,
  pkgs,
  ...
}: let
  ed25519-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhmSdP4sVoCQy7I72E4LBg77WA0dZYeUQHNOlNnD0M6";
in {
  # ...
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  users.users.${params.username} = {
    isNormalUser = true;
    description = "${params.username}";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [ed25519-key];
    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
    hashedPassword = params.hashpass;
  };

  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "yes";
    PasswordAuthentication = false;
  };
  users.users."root".openssh.authorizedKeys.keys = [
    ed25519-key
  ];
}
