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

    vscode-server.url = "github:nix-community/nixos-vscode-server";
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkNixos = params' @ {
      gui ? false,
      username ? "jaign",
      proxy ? null,
      ...
    }: let
      params =
        {
          inherit gui username proxy;
        }
        // params';
      #  默认值不会 params' 传递，所以需要手动传递
    in
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs params;};
        modules = [
          inputs.nur.modules.nixos.default
          ./systems/setup-config.nix
          ./systems/setup-home.nix

          ./tools/fish-in-bash.nix
          ./tools/nix-ld.nix # fix vscode
        ];
      };
  in {
    diskoConfigurations.disk-ext4 = import ./systems/disks/ext4.nix;
    nixosConfigurations = {
      fnosvm-nixos = mkNixos {
        machine = "fnosvm";
        hostname = "fnosvm-nixos";
        proxy = "http://192.168.30.29:7890";
      };
      hyperv-nixos = mkNixos {
        gui = true;
        machine = "hyperv";
        hostname = "hyperv-nixos";
      };
      wsl-nixos = mkNixos {
        machine = "wsl";
        hostname = "wsl-nixos";
        username = "nixos";
      };
    };
  };
}
