{
  inputs,
  params,
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
      inherit inputs params;
    };

    users.${params.username} = {...}: {
      imports = [
        ../homes/home.nix
      ];
    };
  };
}
