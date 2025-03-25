{inputs, ...}: {
  nixpkgs.overlays = [
    (final: prev: rec {
      # 配置 unstable 允许 unfree 软件
      unstable = import inputs.nixpkgs-unstable {
        system = prev.system;
        config = {
          allowUnfree = true;
          # 如果需要，可以添加其他特定许可证的例外
          # allowBroken = true;
          # allowInsecure = true;
        };
      };
    })
    (final: prev: rec {
      custom = import ../../pkgs {pkgs = prev;};
    })
  ];
}
