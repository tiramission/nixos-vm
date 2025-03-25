{
  config,
  params,
  lib,
  pkgs,
  ...
}: {
  # ...
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  users.users.${params.username} = {
    isNormalUser = true;
    description = "${params.username}";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [params.pkey];
    packages = with pkgs; [
      #  firefox
      #  thunderbird
    ];
    passwordFile = config.age.secrets.user-password.path;
  };

  services.openssh.enable = true;
  services.openssh.settings = {
    PermitRootLogin = "yes";
    PasswordAuthentication = false;
  };
  users.users."root".openssh.authorizedKeys.keys = [
    params.pkey
  ];
}
