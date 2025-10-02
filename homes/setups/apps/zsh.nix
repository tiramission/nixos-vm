{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    initContent = ''
      if [[ -f ~/.env ]]; then
        source ~/.env
      fi
    '';
  };
}
