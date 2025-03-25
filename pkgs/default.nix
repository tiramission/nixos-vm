{pkgs ? import <nixpkgs> {}}: {
  sarasa-term-sc-nerd = pkgs.callPackage ./sarasa-term-sc-nerd.nix {};
}
