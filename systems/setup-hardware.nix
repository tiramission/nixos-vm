{params, ...}: {
  imports = [
    ./hardwares/${params.machine}.nix
  ];
}
