{params, ...}: {
  networking.nftables.enable = true;
  networking.firewall.checkReversePath = !params.wsl;

  users.users.${params.username}.extraGroups = ["incus-admin"];

  networking.firewall.trustedInterfaces = ["incusbr0"];
  virtualisation.incus = {
    enable = true;
    ui.enable = true;
    preseed = {
      profiles = [
        {
          devices = {
            eth0 = {
              name = "eth0";
              network = "incusbr0";
              type = "nic";
            };
            root = {
              path = "/";
              pool = "default";
              size = "35GiB";
              type = "disk";
            };
          };
          name = "default";
        }
      ];
      networks = [
        {
          config = {
            "ipv4.address" = "10.0.100.1/24";
            "ipv4.nat" = "true";
          };
          name = "incusbr0";
          type = "bridge";
        }
      ];
      storage_pools = [
        {
          config = {
            source = "/var/lib/incus/storage-pools/default";
          };
          driver = "dir";
          name = "default";
        }
      ];
    };
  };
}
