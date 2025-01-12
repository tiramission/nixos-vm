{pkgs, ...}: {
  imports = [
  ];

  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    grc
  ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      scheme set catppuccin
    '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }

      {
        name = "fish-color-scheme-switcher";
        src = pkgs.fetchFromGitHub {
          owner = "h-matsuo";
          repo = "fish-color-scheme-switcher";
          rev = "9f9720dbf06cd4690e6b78c3daa897ae05f792bb";
          sha256 = "9VOgPxCNfuyy9DlicaN6W2EQ6OQFq/z8oSx1l9RitP4=";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "tiramission";
    userEmail = "37465086+tiramission@users.noreply.github.com";
    extraConfig = {
      safe.directory = "*";
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };
}
