inputs: let
  defaultParams = {
    gui = false;
    username = "jaign";
    hashpass = "$y$j9T$YL92Oi1f0ZSAE9Zcyj5M5/$Ktasy.qAJvFc8DZHKBLz9dq1kk0vA87opaJ8ckaObm.";
    proxy = null;
  };
  mlib = {
    # 与 lib.optionals 相反的函数：先接受模块列表，再接受条件
    includeif = modules: condition: inputs.nixpkgs.lib.optionals condition modules;
  };
in
  params': let
    params = defaultParams // params';
  in
    inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs params mlib;};
      modules = [
        inputs.nur.modules.nixos.default
        ../systems/setup-config.nix
        ../systems/setup-home.nix
        ../systems/setup-tools.nix
      ];
    }
