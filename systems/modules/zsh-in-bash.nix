{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    mtool.zsh-in-bash.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable zsh when login to bash";
    };
  };
  config = lib.mkIf config.mtool.zsh-in-bash.enable {
    programs.zsh.enable = true;
    programs.bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "zsh" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.zsh}/bin/zsh $LOGIN_OPTION
        fi
      '';
    };
  };
}
