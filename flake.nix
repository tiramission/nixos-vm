{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-25.05 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
    vscode-server.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    nix4vscode.url = "github:nix-community/nix4vscode";
    nix4vscode.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkNixos = import ./lib/mk-nixos.nix inputs {
      gui = false;
      wsl = false;
      username = "jaign";
      hashpass = "$y$j9T$YL92Oi1f0ZSAE9Zcyj5M5/$Ktasy.qAJvFc8DZHKBLz9dq1kk0vA87opaJ8ckaObm.";
      proxy = null;
      docker = true;
    }; # 参数
  in {
    diskoConfigurations.disk-ext4 = import ./systems/disks/ext4.nix;
    nixosConfigurations = {
      fnosvm-nixos = mkNixos {
        machine = "fnosvm";
        hostname = "fnosvm-nixos";
        proxy = "http://192.168.30.150:7890";
      };
      hyperv-nixos = mkNixos {
        gui = true;
        machine = "hyperv";
        hostname = "hyperv-nixos";
      };
      wsl-nixos = mkNixos {
        machine = "wsl";
        wsl = true;
        hostname = "wsl-nixos";
      };
    };
    packages = import ./lib/mk-pkgs.nix inputs;
  };
}
