{
  config,
  pkgs,
  ...
}: let
  src = pkgs.fetchFromGitHub {
    owner = "JannoTjarks";
    repo = "catppuccin-zsh";
    rev = "main";
    sha256 = "sha256-5mivlJpfp89VNMg9PS20DaMYnws+62Yrktlx5On2Puw=";
  };
in {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    oh-my-zsh = {
      enable = true;
      custom = "${src}";
      theme = "catppuccin";
      plugins = [
        "git"
      ];
      extraConfig = ''
        CATPPUCCIN_FLAVOR="macchiato"
        CATPPUCCIN_SHOW_TIME=true
      '';
    };
    initContent = ''
      if [[ -f ~/.env ]]; then
        source ~/.env
      fi
    '';
  };
}
