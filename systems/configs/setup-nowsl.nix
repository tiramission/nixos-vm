{
  config,
  params,
  lib,
  pkgs,
  ...
}: let
  ed25519-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhmSdP4sVoCQy7I72E4LBg77WA0dZYeUQHNOlNnD0M6";
in {
  config = lib.mkIf (params.machine != "wsl") {
    # ...
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

    services.openssh.enable = true;
    services.openssh.settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
    };
    users.users."root".openssh.authorizedKeys.keys = [
      ed25519-key
    ];
  };
}
