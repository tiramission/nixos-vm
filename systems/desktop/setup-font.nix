{
  lib,
  params,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      # sarasa-gothic
      # lxgw-wenkai
      source-code-pro
      # comic-relief
      hack-font
      fira-code
      mononoki
      lexend # improve reading fluency
      # recursive
      # ibm-plex
      jetbrains-mono
      # cascadia-code
      # nerd-fonts.symbols-only
      # nerdfonts
      custom.sarasa-term-sc-nerd
      maple-mono.NF-CN-unhinted
    ];

    fontconfig = {
      # antialias = true; # default true
      # hinting.enable = false; # default true
      # subpixel = {
      #   rgba = "none"; # default rgb
      #   lcdfilter = "none"; # default default
      # };

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
