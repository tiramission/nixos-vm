{
  params,
  pkgs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    package = pkgs.unstable.docker;
  };
  users.users.${params.username}.extraGroups = ["docker"];

  services.dockerRegistry = {
    enable = true;
  };
}
