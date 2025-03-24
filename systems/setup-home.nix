{
  inputs,
  params,
  mlib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm.bak";
    extraSpecialArgs = {
      inherit inputs params mlib;
    };

    users.${params.username} = {...}: {
      imports = [
        ../homes/home.nix
      ];
    };
  };
}
