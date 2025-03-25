{inputs, ...}: {
  nixpkgs.overlays = [
    (final: prev: rec {
      gh = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.gh;
      unstable = inputs.nixpkgs-unstable.legacyPackages.${prev.system};
    })
  ];
}
