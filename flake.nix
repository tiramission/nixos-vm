{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-24.11 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkNixos = params:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs params;};
        modules = [
          ./systems/setup-config.nix
          ./systems/setup-home.nix
          ./tools/fish-in-bash.nix
        ];
      };
  in {
    diskoConfigurations.disk = import ./systems/disk.nix;
    nixosConfigurations = {
      fnvm = mkNixos {
        gui = false;
        machine = "fnvm";
      };
      hyperv = mkNixos {
        gui = true;
        machine = "hyperv";
      };
    };
  };
}
