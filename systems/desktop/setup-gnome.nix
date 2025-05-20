{
  pkgs,
  params,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  systemd.services.gnome-remote-desktop = {
    wantedBy = ["graphical.target"];
  };

  networking.firewall.allowedTCPPorts = [3389];
  networking.firewall.allowedUDPPorts = [3389];

  users.users.gdm = {extraGroups = ["video"];};
  users.users.${params.username} = {extraGroups = ["video"];};
}
