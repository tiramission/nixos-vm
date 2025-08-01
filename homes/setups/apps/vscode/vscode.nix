{
  pkgs,
  lib,
  params,
  ...
}: {
  home.file.".vscode/argv.json".source = (pkgs.formats.json {}).generate "argv" {
    "locale" = "zh-cn";
    "enable-crash-reporter" = true;
    "crash-reporter-id" = "e8f04980-4b6c-41a6-8a42-6dd151b0f0aa";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    mutableExtensionsDir = false;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = {
        "window.dialogStyle" = "custom";
        "window.titleBarStyle" = "custom";
        "window.restoreWindows" = "none";
        "workbench.colorTheme" = "SynthWave '84";
        "workbench.iconTheme" = "helium-icon-theme";
        "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
        "workbench.preferredLightColorTheme" = "Catppuccin Latte";
        "editor.fontFamily" = "'Maple Mono NF CN', 'Sarasa Term SC Nerd', 'Source Code Pro', 'Noto Serif CJK SC'";
        "editor.fontSize" = 15;
      };
      extensions = pkgs.nix4vscode.forVscode [
        "ms-ceintl.vscode-language-pack-zh-hans"
        "catppuccin.catppuccin-vsc"
        "catppuccin.catppuccin-vsc-icons"
        "bbenoist.nix"
        "golang.go"
        "helgardrichard.helium-icon-theme"
        "robbowen.synthwave-vscode"
      ];
    };
  };
}
