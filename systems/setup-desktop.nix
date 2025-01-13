{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  users.users.gdm = {extraGroups = ["video"];};
  users.users.jaign = {extraGroups = ["video"];};

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons

        fcitx5-gtk
        libsForQt5.fcitx5-qt
      ];
    };
  };
}
